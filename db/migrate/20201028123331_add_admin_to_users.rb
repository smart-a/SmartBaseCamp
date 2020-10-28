class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    User.create({
      firstname:'Administrator', 
      lastname:'', 
      email:'admin@smartbasecamp.com', 
      user_role:'admin',
      password:'admin'
    })
  end
end
