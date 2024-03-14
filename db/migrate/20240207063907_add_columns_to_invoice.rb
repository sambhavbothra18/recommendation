class AddColumnsToInvoice < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :invoice_number, :string
    add_column :invoices, :order_number, :string
    add_column :invoices, :invoice_date, :datetime
    add_column :invoices, :due_date, :datetime
    add_column :invoices, :total_due, :decimal, precision: 10, scale: 6
  end
end
