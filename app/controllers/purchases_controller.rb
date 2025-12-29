class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[ show edit update destroy ]

  def index
    @purchases = Purchase.includes(:wine, :purchase_items).order(purchase_date: :desc)
  end

  def show
  end

  def new
    @purchase = Purchase.new
    @purchase.purchase_items << @purchase.purchase_items.build
    @purchase.wine_id = params.fetch(:wine_id, nil)
  end

  def edit
  end

  def create
    @purchase = Purchase.new(purchase_params)

    if @purchase.save
      redirect_to @purchase, notice: "Purchase was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @purchase.update(purchase_params)
      redirect_to @purchase, notice: "Purchase was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @purchase.destroy!
    redirect_to purchases_path, notice: "Purchase was successfully destroyed.", status: :see_other
  end

  private

  def set_purchase
    @purchase = Purchase.find(params.expect(:id))
  end

  def purchase_params
    params.expect(purchase: [ :quantity, :wine_id, :comment, :price_per_bottle_in_cents, :gift, :store, :new_store, :town, { purchase_items_attributes: [%i[_destroy id location_id quantity]] } ]).tap do |parameters|
      parameters[:store] = parameters[:new_store] if parameters[:new_store].presence
      parameters.delete :new_store
    end
  end
end
