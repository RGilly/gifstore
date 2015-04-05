class ImagesController < ApplicationController
	before_action :authenticate_user!

  def index
  	@images = current_user.images
  end

  def show
    @image = Image.find(params[:q])
  end

  def new
  	@image = Image.new
  end

  def create

  	@image = current_user.images.build(image_params) 

  	if @image.save 
  		redirect_to images_path
  	else
      render :new
    end
  end

  def edit
  	@image = current_user.images.find(params[:id])
  end

  def update
  	#have to retrieve data from databse to update
  	@image = current_user.images.find(params[:id])

  	if @image.update_attributes(image_params) #if photo able to update these attributes
  		redirect_to images_path
  	else
  		render :edit
  	end
  end

  private

# in order for the carrierwave remote URL to work need to pass it in here.

  def image_params
  	params.require(:image).permit(:file, :title, :categories, :remote_file_url)
  end
end