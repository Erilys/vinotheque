class DiscrepanciesController < ApplicationController

  def create
    @discrepancy = Discrepancy.new(discrepancy_params)

    if @discrepancy.save
      redirect_to @discrepancy.location, notice: t('.success')
    else
      redirect_to @discrepancy.location, notice: t('.error')
    end
  end

  private

  def discrepancy_params
    params.expect(discrepancy: [ :quantity, :location_id, :wine_id ])
  end
end
