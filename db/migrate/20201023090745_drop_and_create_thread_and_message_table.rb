class DropAndCreateThreadAndMessageTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :app_threads
    create_table :app_threads do |t|
      t.integer :user_id
      t.integer :project_id
      t.text :th_content

      t.timestamps
    end

    drop_table :messages
    create_table :messages do |t|
      t.integer :user_id
      t.integer :app_thread_id
      t.integer :message_id
      t.string :msg_content

      t.timestamps
    end
  end
end
