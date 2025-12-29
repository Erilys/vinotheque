class PurchaseItemsController < ApplicationController

  def index
    @purchase_items = PurchaseItem.includes(:location, :wine, :source)
                               .order(created_at: :desc)
  end

  private
end
