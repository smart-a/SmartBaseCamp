class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :app_thread_id
      t.references :message, null: true, foreign_key: true
      t.string :msg_content

      t.timestamps
    end
  end
end
