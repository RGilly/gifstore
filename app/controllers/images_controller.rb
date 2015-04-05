class ImagesController < ApplicationController
	before_action :authenticate_user!

  def index
  	@images = current_user.images
  end

  def new
  	@image = Image.new
  end

  def create

  	@image = current_user.imagess.build(image_params) 

  	#this is an alternate way that is commonly used in production

  	if @image.save 
  		redirect_to images_path
  	else

  end

  def edit
  	@image = current_user.imagess.find(params[:id])
  end

  def update
  	#have to retrieve data from databse to update
  	@image = current_user.imagess.find(params[:id])

  	if @image.update_attributes(image_params) #if photo able to update these attributes
  		redirect_to images_path
  	else
  		render :edit
  	end
  end

  private

  def image_params
  	params.require(:image).permit(:file, :title, :categories)
  end
end