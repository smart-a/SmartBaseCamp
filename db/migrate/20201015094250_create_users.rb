class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    # drop_table :users
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password
      t.string :user_role, :default => 'user'
      t.timestamps
    end
  end
end
