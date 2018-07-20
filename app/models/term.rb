class Term < ActiveRecord::Base
  belongs_to :access_note
  belongs_to :citation
end
