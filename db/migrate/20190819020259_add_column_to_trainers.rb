class AddColumnToTrainers < ActiveRecord::Migration[5.2]
  def change
    add_column :trainers, :created_at, :datetime, null: false
    add_column :trainers, :updated_at, :datetime, null: false
  end
end
