class Invoice < ApplicationRecord
	mount_uploader :attachment, PdfUploaderUploader
end
