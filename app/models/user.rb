class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :notifications, foreign_key: :recipient_id
  has_many :forum_threads
  has_many :posts
  validates :name, presence: true
end
