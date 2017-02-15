class Question < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :answers
  validates_presence_of :title
  # default_scope { order('upvotes DESC') }

end
