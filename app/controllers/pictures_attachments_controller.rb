# frozen_string_literal: true

class PicturesAttachmentsController < ApplicationController
  def destroy
    wine = Wine.find(params[:wine_id])
    @attachment = ActiveStorage::Attachment.find(params[:id])
    @attachment.purge
    respond_to do |format|
      format.html { redirect_to edit_wine_path(wine) }
      format.turbo_stream
    end
  end
end
