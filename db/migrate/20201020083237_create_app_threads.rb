class CreateAppThreads < ActiveRecord::Migration[6.0]
  def change
    create_table :app_threads do |t|
      t.integer :project_id
      t.text :th_content

      t.timestamps
    end
  end
end
