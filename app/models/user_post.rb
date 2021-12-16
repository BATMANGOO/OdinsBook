class UserPost < ApplicationRecord
  belongs_to :user

  validates :message, presence: true, length: { maximum: 140 }
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
