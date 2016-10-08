=begin
class Resume
  include Mongoid::Document

  field :title, :type => String
  field :user_id, :type => Integer
  field :progress, :type => Integer


  SINGULAR_ANSWER_SETS = Question::SINGULAR_CATEGORIES.keys
  PLURAL_ANSWER_SETS   = Question::PLURAL_CATEGORIES.keys

  SINGULAR_ANSWER_SETS.each do |name|
    embeds_one name, :class_name => "AnswerSet::#{name.camelize}"
  end

  PLURAL_ANSWER_SETS.each do |name|
    embeds_many name.pluralize, :class_name => "AnswerSet::#{name.camelize}"
  end

  ANSWER_SETS = SINGULAR_ANSWER_SETS + PLURAL_ANSWER_SETS.map(&:pluralize)

  accepts_nested_attributes_for *(ANSWER_SETS), :allow_destroy => true

  def user
    User.where(:id => user_id).first
  end

  def user=(user)
    update_attributes(:user_id => user.id)
  end

  def get_relation_ids
    ids = {}
    Resume.has_many_relations.each do |rel|
      ids[rel] = public_send(rel).map{ |itm| itm.id.to_s }
    end
    ids
  end

  def matches_params?(params)
    return true
    q_cats = Question::Base.pluck(:key, :category).to_h
    pp q_cats
    params.each do |key, value|
      cat = q_cats[key.to_s]
      if SINGULAR_ANSWER_SETS.include?(cat)
        return false unless public_send(cat).public_send(key) == value
      else
        cat = cat.pluralize
        return false unless public_send(cat).map(&key.to_sym).include?(value)
      end
    end
    true
  end

  class << self
    def create_with_associations
      Resume.create do |r|
        SINGULAR_ANSWER_SETS.each do |name|
          r.public_send("#{name}=", "AnswerSet::#{name.camelize}".constantize.new)
        end
      end
    end

    def has_many_relations
      Resume.relations.select do |key, value|
        value[:relation] == Mongoid::Relations::Embedded::Many
      end.keys
    end

    def search(params)
      search_params = make_search_params(params)
      return Resume.none if search_params.blank?
      Resume.where(search_params)
    end
  end

  private

  def self.make_search_params(params)
    return {} if params.blank?
    q_cats = Question::Base.pluck(:key, :category).to_h
    search_params = {}
    params.each do |key, value|
      next if value.blank?
      next unless cat_name = q_cats[key.to_s]
      cat_name = cat_name.pluralize if PLURAL_ANSWER_SETS.include?(cat_name)
      search_params["#{cat_name}.#{key}"] = value
    end
    search_params
  end
end

=end

class Resume < ActiveRecord::Base
  belongs_to :user

  SINGULAR_ANSWER_SETS = Question::SINGULAR_CATEGORIES.keys
  PLURAL_ANSWER_SETS   = Question::PLURAL_CATEGORIES.keys

  SINGULAR_ANSWER_SETS.each do |name|
    has_one name.to_sym, class_name: "Answer::#{name.camelize}", dependent: :destroy
  end

  PLURAL_ANSWER_SETS.each do |name|
    has_many name.pluralize.to_sym, class_name: "Answer::#{name.camelize}", dependent: :destroy
  end

  ANSWER_SETS = SINGULAR_ANSWER_SETS + PLURAL_ANSWER_SETS.map(&:pluralize)

  accepts_nested_attributes_for *(ANSWER_SETS), :allow_destroy => true

  class << self
    def create_with_associations
      Resume.create do |r|
        SINGULAR_ANSWER_SETS.each do |name|
          r.public_send("#{name}=", "Answer::#{name.camelize}".constantize.new)
        end
      end
    end

    def search(params, company)
      categories, search_params = make_search_params(params, company)
      return Resume.none if search_params.blank?
      Resume.joins(categories).where(search_params)
    end

    def has_many_relations
      Resume.reflect_on_all_associations(:has_many).map(&:name)
    end
  end

  def get_relation_ids
    ids = {}
    Resume.has_many_relations.each do |rel|
      ids[rel] = public_send(rel).map{ |itm| itm.id.to_s }
    end
    ids
  end

  private
  def self.make_search_params(params, company)
    unless company.nil?
      params = params.select {|k, v| company.subscription.searchable_fields.include? k}
    end
    return {} if params.blank?
    q_cats = Question::Base.pluck(:key, :category).to_h
    search_params = {}
    categories = []
    params.each do |key, value|
      next if value.blank?
      next unless cat_name = q_cats[key.to_s]
      cat_name = cat_name.pluralize if PLURAL_ANSWER_SETS.include?(cat_name)
      search_params["answer_#{cat_name.pluralize}.#{key}"] = value
      categories << cat_name.to_sym
    end
    return categories.uniq, search_params
  end
end
