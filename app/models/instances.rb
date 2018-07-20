class Instance < ActiveRecord::Base
  has_many :terms, through: :term_instances
end
