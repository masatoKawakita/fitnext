class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :trainers, :user_id, :integer
  end
end
