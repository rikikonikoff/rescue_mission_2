class Question < ApplicationRecord
  belongs_to :asker, class_name: :User
  has_many :answers
  has_many :users, through: :answers

  validates :title, presence: true, length: { minimum: 50 }
  validates :description, presence: true, length: { minimum: 150 }
end
