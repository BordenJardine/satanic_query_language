class TermInstance < ActiveRecord::Base
  belongs_to :term
  belongs_to :instance
end
