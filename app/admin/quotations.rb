ActiveAdmin.register Quotation do
  config.batch_actions = false

  permit_params :quotation_name, :status, :document, :customer_id


    form :html => {:autocomplete => "off"} do |f|
      f.semantic_errors *f.object.errors.keys
      f.inputs "Quotation" do
        f.input :quotation_name, :label => "Quotation Name"
        f.input :status
        f.input :customer, as: :select, collection: Customer.all.map { |c| [c.name, c.id] }
        f.input :document, as: :file, label: "Quotation Document", input_html: { accept: 'application/pdf' }
      end
      f.actions
    end

    index do
      selectable_column
      id_column
      column :quotation_name
      column :status
      column :customer
      actions
    end

    filter :customer
    filter :created_at


    controller do
    end
end
