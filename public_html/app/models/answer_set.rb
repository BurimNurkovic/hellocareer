module AnswerSet
  class Base
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic

    field :category, type: String

    def method_missing(name, *args, &block)
      if name.to_s =~ /_key\z/
        self[name]
      else
        super
      end
    end
  end

  class Singular < Base
    embedded_in :resume
  end

  class Plural < Base
    embedded_in :resume
  end

  Question::SINGULAR_CATEGORIES.keys.each do |cat|
    const_set cat.camelize, Class.new(Singular)
  end

  Question::PLURAL_CATEGORIES.keys.each do |cat|
    const_set cat.camelize, Class.new(Plural)
  end

end
