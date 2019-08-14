class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def up
    change_column_null :users, :trainer_id, true
  end

  # 変更前の状態
  def down
    change_column_null :users, :trainer_id, false
  end
end
