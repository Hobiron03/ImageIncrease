class TopPagesController < ApplicationController
	def index
		Dir.mkdir("public/user_images") unless File.exist?("public/user_images")
		Dir.mkdir("public/user_create_img") unless File.exist?("public/user_create_img")
	end

	def delete_image
		if File.exist?("public/user_images/target_img.jpg")
			File.delete ("public/user_images/target_img.jpg")
		end
		redirect_to(root_url)
	end

	def create
		if params[:image]
			image_name = "target_img.jpg"
			image = params[:image]
			File.binwrite("public/user_images/#{image_name}", image.read)
		end
		system('python3 increase_image.py public/user_images/target_img.jpg')

		redirect_to(root_url)
	end

	private
	def fileupload_params
		params.require(:fileupload).permit(:file)
	end
end
