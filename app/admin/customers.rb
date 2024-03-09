ActiveAdmin.register Customer do
  config.batch_actions = false

  permit_params :name, :mobile, :email, :address
  
  index do
    selectable_column
    id_column
    column :name
    column :mobile
    column :email
    column :address
    column "Download Latest Quotation" do |resource|
      quote = resource.quotations.last
      if quote.present?
        link_to "Quotation_#{quote.id}", download_file_admin_customer_path(resource.id), target: :_blank
      end
    end
    actions
  end

  member_action :download_file, :method => :get do
    customer = Customer.find(params[:id])
    quote = customer.quotations.last
    if quote.present?
        file_name = "#{quote.quotation_name}.pdf"
        url = quote.document.expiring_url
        data  = open(url)
        send_data(
          data.read,
          filename: file_name,
          type: quote.document_content_type,
          disposition: params[:inline] || "attachment",
        )
    end
  end

  filter :name
  filter :mobile
end
