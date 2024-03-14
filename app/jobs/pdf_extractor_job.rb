require 'pdf-reader'
# require 'doc_ripper'

class PdfExtractorJob < ApplicationJob
  def perform(invoice_id, attachment_path)
    invoice = Invoice.find(invoice_id)
    pdf_text = extract_text_from_pdf(attachment_path)
    invoice_data = parse_invoice_data(pdf_text)
    invoice.update(invoice_data)
  end

  private

  def extract_text_from_pdf(attachment)
   	# reader = PDF::Reader.new(attachment)
   	reader = Poppler::Document.new(attachment)
   	# reader = Iguvium.read(attachment)
   	# reader = DocRipper::rip(attachment)
    pdf_text = ''
    reader.pages.each do |page|
      pdf_text << page.text
    end
    pdf_text
  end

  def parse_invoice_data(pdf_text)
    invoice_data = {}
    invoice_data[:invoice_number] = extract_invoice_number(pdf_text)
    invoice_data[:order_number] = extract_order_number(pdf_text)
    invoice_data[:invoice_date] = extract_invoice_date(pdf_text)
    invoice_data[:due_date] = extract_due_date(pdf_text)
    invoice_data[:total_due] = extract_total_price(pdf_text)
    invoice_data[:tax] = extract_tax(pdf_text)
    invoice_data
  end

  def extract_invoice_number(pdf_text)
    match = pdf_text.match(/INVOICE\s*(.+)/) || pdf_text.match(/Invoice Number\s*(.+)/)
    match ? match[1].strip : nil
  end

  def extract_order_number(pdf_text)
    match = pdf_text.match(/Order Number\s*(.+)/)
    match ? match[1].strip : nil
  end

  def extract_invoice_date(pdf_text)
    match = pdf_text.match(/Invoice Date\s*(.+)/) || pdf_text.match(/Date\s*(.+)/)
    match ? match[1].strip : nil
  end

  def extract_due_date(pdf_text)
    match = pdf_text.match(/Due Date\s*(.+)/) || pdf_text.match(/Due\s*(.+)/)
    match ? match[1].strip : nil
  end

  def extract_total_price(pdf_text)
    match = pdf_text.match(/TOTAL\s*(.+)/) || pdf_text.match(/Total Due\s*\$?([\d.]+)/)
    match ? match[1].gsub(/[^\d.]/, '').strip.to_f : nil
  end

  def extract_tax(pdf_text)
  	match = pdf_text.match(/Tax\s*(.+)/) || pdf_text.match(/Tax\s*(.+)/)
  	match ? match[1].gsub(/[^\d.]/, '').strip.to_f : nil
  end
end
