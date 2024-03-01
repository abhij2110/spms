class CreateQuotations < ActiveRecord::Migration[6.1]
  def change
    create_table :quotations do |t|
      t.string :quotation_name
      t.string :status
      t.attachment :document
      t.integer :customer_id, foreign_key: true
      t.timestamps
    end
  end
end
