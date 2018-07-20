class Term < ActiveRecord::Base
  belongs_to :access_note
  belongs_to :citation
  has_many :instances, through: :term_instances
end
