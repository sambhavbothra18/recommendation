ActiveAdmin.register Invoice do

  permit_params :attachment, :invoice_number, :order_number , :total_due, :invoice_date, :due_date , :tax
  
  form do |f|
    f.inputs 'Invoice Details' do
      f.input :attachment, as: :file
    end
    f.actions
  end

 # index do
 #  column :id
 #  column :attachment
 #  column :order_number
 #  column() {|post| link_to 'Approve'}
 # end
 # index do
 #  actions do |post|  link_to "Approve" end
 # end 

  controller do
    def create
      super do |format|
        if params[:invoice][:attachment].present? && @invoice.save
          PdfExtractorJob.perform_now(@invoice.id, params[:invoice][:attachment].tempfile.path)
        end
      end
    end
  end

end
