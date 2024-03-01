class Quotation < ApplicationRecord
	has_attached_file :document,
	                  :storage => :s3,
	                  :path => ":class/:attachment/:id_partition/:style/:filename",
	                  s3_permissions: 'public-read'
	validates_attachment_content_type :document, content_type: ['application/pdf']
	validates :document, presence: true
	belongs_to :customer
end
