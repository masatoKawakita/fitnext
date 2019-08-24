class Trainer < ApplicationRecord
  belongs_to :user, inverse_of: :trainer
  validates :license, :experience, :belongs, presence: true
  has_many :trainer_evaluations
end
