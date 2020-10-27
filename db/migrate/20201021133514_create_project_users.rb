class CreateProjectUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :project_users
    create_table :project_users do |t|
      t.integer :project_id
      t.integer :user_id
      t.timestamps
    end
  end
end
