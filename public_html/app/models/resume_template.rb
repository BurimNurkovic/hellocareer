class ResumeTemplate < ActiveRecord::Base
  mount_uploader :image, ResumeTemplateImageUploader
  validates :body_for_html, :body_for_pdf, presence: true
  validates :handler, inclusion: ActionView::Template::Handlers.extensions.map(&:to_s)

  def path
    "resumes/show/#{id}"
  end

  class Resolver < ActionView::Resolver
    protected

    def find_templates(name, prefix, partial, details)

      return [] unless prefix == 'resumes/show'
      format = details[:formats].first
      return [] unless [:html, :pdf].include? format

      handlers = details[:handlers].map(&:to_s)

      ::ResumeTemplate.where(id: name, handler: handlers).map do |record|
        initialize_template(record, format)
      end
    end

    def initialize_template(record, format)
      source = record.public_send("body_for_#{format}")
      identifier = "ResumeTemplate - #{record.id} - #{record.path.inspect}"
      handler = ActionView::Template.registered_template_handler(record.handler)

      details = {
        format: format,
        updated_at: record.updated_at,
        virtual_path: virtual_path(record.path, false)
      }

      ActionView::Template.new(source, identifier, handler, details)
    end

    def virtual_path(path, partial)
      return path unless partial
      if index = path.rindex("/")
        path.insert(index + 1, "_")
      else
        "_#{path}"
      end
    end
  end
end
