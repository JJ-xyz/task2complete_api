class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text   :description
      t.date   :date_assigned
      t.date   :date_due
      t.date   :date_completed

      t.timestamps
    end
  end
end
