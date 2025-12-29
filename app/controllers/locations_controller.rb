class LocationsController < ApplicationController
  before_action :set_location, only: %i[ show edit update destroy ]

  def index
    @locations = Location.order(:name)
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to @location, notice: "Location was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @location.update(location_params)
      redirect_to @location, notice: "Location was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @location.destroy!
    redirect_to locations_path, notice: "Location was successfully destroyed.", status: :see_other
  end

  private

  def set_location
    @location = Location.find(params.expect(:id))
  end

  def location_params
    params.expect(location: [ :name ])
  end
end
