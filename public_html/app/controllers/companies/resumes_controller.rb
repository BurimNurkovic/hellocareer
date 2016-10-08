class Companies::ResumesController < CompaniesController
  helper_method :current_subscription, :premium_resume?

  def get_oldest_search(searches)
    s = current_company.last_searches
    elm = s.keys.map {|k| DateTime.strptime(k, "%d/%m/%Y %H:%M:%S")}
    return elm.min
  end

  def index
    search_questions = current_company.subscription.searchable_fields
    @questions = Question::Base.where(:key => search_questions)
    if sq = search_params
      searched_items = {}
      search_params.each do |k, v|
        searched_items["#{Question::Base.where(:key => k).first().builder_text}"] = v
      end

      now = DateTime.now.strftime("%d/%m/%Y %H:%M:%S")
      current_company.last_searches[now] = searched_items
      current_company.save
      if current_company.last_searches.size > 20
        oldest = get_oldest_search(current_company.last_searches)
        current_company.last_searches.delete(oldest.strftime("%d/%m/%Y %H:%M:%S"))
        current_company.save
      end

      @resumes = Resume.search(sq, current_company).take(current_subscription.search_limit)
      ResumeSearchQuery.create_from_hash(sq)
      IncrementUsersSearchOccurrencesJob.perform_later(@resumes.map(&:user_id), sq)
    end

    @premium_resumes = current_subscription.premium_resumes
  end

  def show
    @resume = Resume.find(params[:id])
    @resume.increment!(:views_count)
    @questions = Question::Base.order(:order_nr).all.group_by(&:category).to_h
    if premium_resume?(@resume)
      render :premium
    else
      @visible_fields = current_subscription.visible_fields
      render :show
    end
  end

  def premium
    @resume = Resume.find(params[:id])
    if !premium_resume?(@resume) && current_subscription.premium_points > 0
      current_subscription.add_premium_resume(@resume)
    else
      flash[:error] = 'Not enough premium points.'
    end
    redirect_to [:companies, @resume]
  end

  private

  def search_params
    params[:search_query].select{ |k, v| v.present? } if params[:search_query].present?
  end

  def current_subscription
    current_company.subscription
  end

  def premium_resume?(r)
    current_subscription.premium_resume_ids.include?(r.id.to_s)
  end
end
