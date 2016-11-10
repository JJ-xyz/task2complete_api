class AddUserInTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :assigned_to, :integer
    add_column :tasks, :assigned_by, :integer
  end
end
