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
    authorize @album
    @album.destroy
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(photos: [])
  end
end
