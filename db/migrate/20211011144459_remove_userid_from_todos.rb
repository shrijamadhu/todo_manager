class RemoveUseridFromTodos < ActiveRecord::Migration[6.1]
  def change
    remove_column :todos, :userid
  end
end
