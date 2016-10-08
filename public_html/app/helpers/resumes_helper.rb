module ResumesHelper
  def category_group(form, group_name, categories)
    render(
      :partial => 'resumes/category_group',
      :locals  => {
        :form => form,
        :categories => categories,
        :group_name => group_name
      }
    )
  end

  def category(form, category)
    render(
      :partial => 'resumes/free_category',
      :object  => category,
      :locals  => {
        :form => form
      }
    )
  end
end
