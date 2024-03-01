ActiveAdmin.register Customer do
  config.batch_actions = false

  permit_params :name, :mobile, :email, :address
  
end
