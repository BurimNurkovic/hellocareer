class IncrementUsersSearchOccurrencesJob < ActiveJob::Base
  queue_as :default

  def perform(user_ids, params)
    params.each do |k, v|
      next unless k && v
      user_ids.each do |uid|
        so = SearchOccurrence.where(user_id: uid, key: k, value: v).first_or_create!
        so.increment!(:count)
      end
    end
  end
end
