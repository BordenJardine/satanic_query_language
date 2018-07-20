class RelatedTerm < ActiveRecord::Base
  belongs_to :master_term, class_name: 'Term', foreign_key: 'master_term_id'
  belongs_to :other_term, class_name: 'Term', foreign_key: 'other_term_id'
end
