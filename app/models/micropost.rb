class Micropost < ActiveRecord::Base
  belongs_to :user
  has_many :favorite_relations
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end