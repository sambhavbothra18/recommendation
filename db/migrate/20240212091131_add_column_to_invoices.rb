class AddColumnToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :tax, :decimal
    add_column :invoices, :order_number, :string
    add_column :invoices, :due_date, :string
  end
end
