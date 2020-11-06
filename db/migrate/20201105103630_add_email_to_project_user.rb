class AddEmailToProjectUser < ActiveRecord::Migration[6.0]
  def change
    add_column :project_users, :email, :string
  end
end
