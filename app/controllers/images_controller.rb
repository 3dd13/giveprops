class ImagesController < ApplicationController
 
  def create
    
  end
 
	private
	def image_params
    params.require(:images).permit(
      :image
    )
  end
end