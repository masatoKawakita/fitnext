class CreateTrainers < ActiveRecord::Migration[5.2]
  def change
    create_table :trainers do |t|
      t.string :license, default: "", null: false
      t.string :experience, default: "", null: false
      t.string :belongs, default: "", null: false
    end
  end
end
