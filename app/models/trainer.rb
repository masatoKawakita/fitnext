class Trainer < ApplicationRecord
  belongs_to :user, inverse_of: :trainer
  validates :license, :experience, :belongs, presence: true
  has_many :trainer_evaluations, dependent: :destroy
  has_many :trainer_evaluation_users, through: :trainer_evaluations, source: :user #MEMO:トレーナーが評価をしたユーザー情報を取得できる
end
