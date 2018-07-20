class Citation < ActiveRecord::Base
  has_many :terms
end
