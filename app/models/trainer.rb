class Trainer < ApplicationRecord
  belongs_to :user, inverse_of: :trainer
end
