require 'pry-byebug'
require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    class_name.camelcase.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    options = {
                class_name: name.camelcase,
                foreign_key: name.foreign_key.to_sym,
                primary_key: :id
                }.merge(options)

    self.foreign_key = options[:foreign_key]
    self.class_name  = options[:class_name]
    self.primary_key = options[:primary_key]

  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    options = {
                class_name: name.camelcase.singularize,
                foreign_key: self_class_name.foreign_key.to_sym,
                primary_key: :id
                }.merge(options)

    self.foreign_key = options[:foreign_key]
    self.class_name  = options[:class_name]
    self.primary_key = options[:primary_key]
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    fk = self.send(:foreign_key)
    mc = self.model_class

    define_method(name) do
      mc.where(primary_key: fk).first
    end
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
end
