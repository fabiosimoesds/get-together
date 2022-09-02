class AlbumsController < ApplicationController
  before_action :set_album, only: %i[show edit update destroy]
  def show
    authorize @album
  end

  def edit
    authorize @album
  end

  def update
    authorize @album
    @album.update(album_params)
    redirect_to album_path(@album)
  end

  def destroy
    user = @album.user
    authorize @album
    @album.destroy
    redirect_to user_path(user), status: :see_other
  end

  # def delete_image_attachment
  #   @album = Album.first
  #   @user = current_user
  #   @image = ActiveStorage::Blob.find_signed(params[:id])
  #   raise
  #   authorize @album
  #   @image.purge
  # end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(photos: [])
  end
end
