# class PdfExtractorWorker
# 	include Sidekiq::Worker

# 	def perform(invoice_id, attachment_path)
# 		invoice = Invoice.find(invoice_id)
# 	    PdfDataExtractor.extract_and_save(attachment_path, invoice)
# 	end
# end