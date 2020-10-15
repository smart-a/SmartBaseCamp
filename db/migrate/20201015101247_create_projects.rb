class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.datetime :exp_completion_date
      t.datetime :completion_date

      t.timestamps
    end
  end
end
