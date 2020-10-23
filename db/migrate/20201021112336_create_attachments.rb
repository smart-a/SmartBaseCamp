class CreateAttachments < ActiveRecord::Migration[6.0]
  def change
    drop_table :attachments
    create_table :attachments do |t|
      t.integer :project_id
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
