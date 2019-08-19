class CreateTrainers < ActiveRecord::Migration[5.2]
  def change
    create_table :trainers do |t|
      t.string :license, null: false
      t.string :experience, null: false
      t.string :belongs, null: false
    end
  end
end
