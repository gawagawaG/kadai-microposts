class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :likes
  has_many :reverses_of_like_microposts,  class_name: 'Like', foreign_key: 'user'
  has_many :like_microposts, through: :likes, source: :micropost
  has_many :liked_microposts, through: :reverses_of_like_microposts, source: :user
  
  
  def like(micropost)
    self.likes.find_or_create_by(micropost: micropost.id)
  end
  
  def unlike(micropost)
    like = self.likes.find_by(micropost: micropost.id)
    like.destroy if like
  end
  
  def like?(micropost)
    self.likes.include?(micropost)
  end
  
end
