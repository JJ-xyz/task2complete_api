class AddColumnToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :is_complete, :boolean
  end
end
