class AddTrainerRefToTrainerEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_reference :trainer_evaluations, :trainer, foreign_key: true
  end
end
