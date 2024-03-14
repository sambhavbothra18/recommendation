class RemoveColumnFromInvoices < ActiveRecord::Migration[6.0]
  def change
    remove_column :invoices, :order_number
    remove_column :invoices, :due_date
    change_column :invoices, :invoice_date, :string
  end
end
