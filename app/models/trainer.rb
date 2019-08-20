class Trainer < ApplicationRecord
  belongs_to :user, inverse_of: :trainer
  validates :license, :experience, :belongs, presence: true
end
