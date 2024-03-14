# # app/services/pdf_data_extractor.rb
# require 'pdf-reader'

# class PdfDataExtractor
  # def extract_and_save(attachment, invoice)
  # 	byebug
  #   pdf_text = extract_text_from_pdf(attachment)
  #   invoice_data = parse_invoice_data(pdf_text)
  #   invoice.update(invoice_data)
  # end

  # private

  # def self.extract_text_from_pdf(attachment)
  # 	byebug
  #   reader = PDF::Reader.new(attachment)
  #   pdf_text = ''
  #   reader.pages.each do |page|
  #     pdf_text << page.text
  #   end
  #   return pdf_text
  # end

  # def self.parse_invoice_data(pdf_text)
  # 	byebug
  #   invoice_data = {}
  #   invoice_data[:invoice_number] = extract_invoice_number(pdf_text)
  #   invoice_data[:order_number] = extract_order_number(pdf_text)
  #   invoice_data[:invoice_date] = extract_invoice_date(pdf_text)
  #   invoice_data[:due_date] = extract_due_date(pdf_text)
  #   invoice_data[:total_due] = extract_total_due(pdf_text)
  #   return invoice_data
  # end

  # # Define methods to extract data for each field from the PDF text
  # def self.extract_invoice_number(pdf_text)
  #   match = pdf_text.match(/Invoice Number:\s*(.+)/)
  #   match ? match[1].strip : nil
  # end

  # def self.extract_order_number(pdf_text)
  #   match = pdf_text.match(/Order Number:\s*(.+)/)
  #   match ? match[1].strip : nil
  # end

  # def self.extract_invoice_date(pdf_text)
  #   match = pdf_text.match(/Invoice Date:\s*(.+)/)
  #   match ? match[1].strip : nil
  # end

  # def self.extract_due_date(pdf_text)
  #   match = pdf_text.match(/Due Date:\s*(.+)/)
  #   match ? match[1].strip : nil
  # end

  # def self.extract_total_due(pdf_text)
  #   match = pdf_text.match(/Total Due:\s*\$?([\d.]+)/)
  #   match ? match[1].strip : nil
  # end
end
