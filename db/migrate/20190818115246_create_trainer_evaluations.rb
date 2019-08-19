class CreateTrainerEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :trainer_evaluations do |t|
      t.float :fun_rate, null: false
      t.float :understandable_rate, null: false
      t.float :politeness_rate, null: false
      t.float :kindness_rate, null: false
      t.float :passion_rate, null: false
      t.text :content, limit: 300, null: false
      t.references :user, foreign_key: true
    end
  end
end
