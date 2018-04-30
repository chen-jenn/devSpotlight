class ImagesController < ApplicationController

  def create
    @image = Image.new image_params
    @organization = Organization.find params[:organization_id] 
    @image.organization = @organization
    @image.save 
    redirect_to edit_organization_path @organization
  end

  private

  def image_params
    params.require(:image).permit(
      :image,
      :description
    )
  end

end
