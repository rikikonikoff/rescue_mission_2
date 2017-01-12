class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :body, presence: true, length: { minimum: 50 }
  validates :favorite, inclusion: { in: [true, false] }
end
