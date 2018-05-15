class TopPagesController < ApplicationController
	def index
		
	end

	def create
		uploaded_file = fileupload_params[:file]
		output_path = Rails.root.join('public', uploaded_file.original_filename)
		if uploaded_file
			File.open(output_path, 'w+b') do |fp|
				fp.write  uploaded_file.read
			end
		end

		redirect_to(root_url)
	end

	private
	def fileupload_params
		params.require(:fileupload).permit(:file)
	end
end
