class AddAdminUser < ActiveRecord::Migration[6.1]
  def change
    AdminUser.create!(email: 'superadmin@spms.com', password: 'password', password_confirmation: 'password')
  end
end
