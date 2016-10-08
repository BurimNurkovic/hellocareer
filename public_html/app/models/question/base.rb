class Question::Base < ActiveRecord::Base
  self.table_name = 'questions'

  TYPES = %w( String Text Number Checkbox Dropdown Radio Multiselect Autocomplete Date )

  validates :category, :inclusion => { :in => Question::CATEGORIES }
  validates :key,
    presence: true,
    allow_blank: false,
    uniqueness: true,
    format: { with: /_key\z/, on: :create }

  scope :searchable, ->() do
    where(searchable: true, type: [Question::Dropdown, Question::Autocomplete])
  end

  def to_partial_path
    "questions/#{self.class.name.demodulize.downcase}_question"
  end

  def repr
    "#{builder_text} | #{key}" 
  end
end
