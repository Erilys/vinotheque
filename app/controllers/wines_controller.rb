class WinesController < ApplicationController
  before_action :set_wine, only: %i[ show edit update destroy ]

  def index
    @wines = Wine.includes(:entries).order(:name, :year)
  end

  def show
  end

  def new
    @wine = Wine.new
  end

  def edit
  end

  def create
    @wine = Wine.new(wine_params)

    if @wine.save
      redirect_to @wine, notice: "Wine was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @wine.update(wine_params)
      redirect_to @wine, notice: "Wine was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @wine.destroy!
    redirect_to wines_path, notice: "Wine was successfully destroyed.", status: :see_other
  end

  private

  def set_wine
    @wine = Wine.find(params.expect(:id))
  end

  def wine_params
    params.expect(wine: [ :name, :year, :xl_id, :comment, :ticket, :aged, :color, :variety, :volume, :titration, :organic, :note, :bottling ])
  end
end
