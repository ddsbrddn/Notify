class ForumThread < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :users, through: :posts
  validates :title, presence: true, length: { minimum: 3 }
end
