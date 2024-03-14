module AccountBlock
  	class CsvHelper
  	  class << self
  	    def convert_to_templates(file)
  	      templates = []
          case File.extname(file)
  	      when '.csv'
  	        csv_file = file.read
  	        CSV.parse(csv_file) do |row|
  	          templates << AccountBlock::HospitalUserProfile.new(name: name , cms_certification_number: cms_certification_number, beds: beds, city: city, state: state, zip: zip, telephone: telephone, gross_revenue: gross_revenue, discharges: discharges, patient_days: patient_days)
  	        end
  	      when '.xlsx'
            xlsx = Roo::Excelx.new(file)
            xlsx.default_sheet = xlsx.sheets.first
            start_row = 7 
            start_row.upto(xlsx.last_row) do |line|
              name = xlsx.cell(line, 1)
              cms_certification_number = xlsx.cell(line, 2)
              beds = xlsx.cell(line, 3)
              city = xlsx.cell(line, 4)
              state = xlsx.cell(line, 5)
              zip = xlsx.cell(line, 6)
              telephone = xlsx.cell(line, 7)
              gross_revenue = xlsx.cell(line, 8)
              discharges = xlsx.cell(line, 9)
              patient_days = xlsx.cell(line, 10)
              templates << AccountBlock::HospitalUserProfile.new(
                name: name,
                cms_certification_number: cms_certification_number,
                beds: beds,
                city: city,
                state: state,
                zip: zip,
                telephone: telephone,
                gross_revenue: gross_revenue,
                discharges: discharges,
                patient_days: patient_days
              )
            end
  	      end
  	      templates
  	    end
  	end
  end
end


