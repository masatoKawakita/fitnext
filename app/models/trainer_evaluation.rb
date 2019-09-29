class TrainerEvaluation < ApplicationRecord
  belongs_to :user
  belongs_to :trainer

  before_save :check_rate
  before_update :check_rate

  def check_rate
    self.fun_rate ||= 0
    self.understandable_rate ||= 0
    self.politeness_rate ||= 0
    self.kindness_rate ||= 0
    self.passion_rate ||= 0
  end
end
