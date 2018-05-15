class TopPagesController < ApplicationController
	def index
	end

	def create
		if params[:image]
			image_name = "target_img.jpg"
			image = params[:image]
			File.binwrite("public/user_images/#{image_name}", image.read)
		end

		redirect_to(root_url)
	end

	private
	def fileupload_params
		params.require(:fileupload).permit(:file)
	end
end
