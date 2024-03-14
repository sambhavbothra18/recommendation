ActiveAdmin.register Sample do

  permit_params :fullname, :first_name, :last_name, :expdate, :status

  action_item only: :index do
    link_to 'Generate Pdf', generate_pdf_admin_samples_path(format: :pdf)
  end

  collection_action :generate_pdf, method: :get do
    respond_to do |format|
      format.pdf do
        @users = Sample.all.order(id: :asc)
        render pdf: 'samples_list',
               template: 'admin/samples/pdf.html.erb',
               disposition: 'attachment'
      end
    end
  end

   action_item only: :index do
    link_to 'Generate XLSX', generate_xlsx_admin_samples_path(format: :xlsx)
  end

  collection_action :generate_xlsx, method: :get do
    respond_to do |format|
      format.xlsx do
        @users = Sample.all

        render xlsx: 'generate_xlsx',
               template: 'admin/samples/generate_xlsx.xlsx.axlsx'
      end
    end
  end
  
end
