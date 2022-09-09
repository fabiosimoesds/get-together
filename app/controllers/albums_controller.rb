class AlbumsController < ApplicationController
  before_action :set_album, only: %i[show edit update destroy]

  def index
    @albums = policy_scope(Album)
  end

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
    authorize @album
    @album.destroy
    redirect_to albums_path, status: :see_other
  end

  def delete_photo_attachment
    # @album = Album.find(params[:id])
    ActiveStorage::Attachment.find(params[:id]).purge
    # @album = @photo.record
    # authorize @album
    # @photo.purge
    # redirect_to album_path(@photo.record), notice: 'Photo deleted'
    # redirect_back(fallback_location: albums_path)
    redirect_to action: 'index'
    skip_authorization
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(photos: [])
  end
end
