class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, limit: 100, null: false
    add_column :users, :birthday, :date, null: false
    add_column :users, :sex, :integer, null: false
    add_column :users, :tel, :string, null: false
    add_column :users, :picture, :string
    add_column :users, :address, :string
    add_column :users, :infomation, :text, limit: 500
    add_column :users, :skype, :string
    add_column :users, :admin, :boolean, default: false, null: false
    add_column :users, :trainer_id, :integer, null: false
  end
end
