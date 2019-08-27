class CreateTrainerEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :trainer_evaluations do |t|
      t.float :fun_rate
      t.float :understandable_rate
      t.float :politeness_rate
      t.float :kindness_rate
      t.float :passion_rate
      t.text :content, limit: 300
      t.references :user, foreign_key: true
    end
  end
end
