class ChangeNotnullToFoods < ActiveRecord::Migration[5.2]
  def up
    change_column_null :foods, :description, false
  end

  def down
    change_column_null :foods, :description, true
  end
end
