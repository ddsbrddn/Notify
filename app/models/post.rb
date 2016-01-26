class Post < ActiveRecord::Base
  belongs_to :forum_thread
  belongs_to :user
  validates :body, presence: true, length: { minimum: 3 }
end
