class CreateProjectUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :project_users do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :email
      t.timestamps
    end
  end
end
