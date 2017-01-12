class User < ApplicationRecord
  has_many :questions, as: :asker
  has_many :answers
  has_many :questions, through: :answers

  validates :name, presence: true
  validates :email, presence: true
end
