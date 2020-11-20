class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :task_title
      t.string :task_detail
      t.string :user_id

      t.timestamps
    end
  end
end
