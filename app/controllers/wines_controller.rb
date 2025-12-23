class WinesController < ApplicationController
  before_action :set_wine, only: %i[ show edit update destroy ]

  # GET /wines
  def index
    @wines = Wine.all
  end

  # GET /wines/1
  def show
  end

  # GET /wines/new
  def new
    @wine = Wine.new
  end

  # GET /wines/1/edit
  def edit
  end

  # POST /wines
  def create
    @wine = Wine.new(wine_params)

    if @wine.save
      redirect_to @wine, notice: "Wine was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /wines/1
  def update
    if @wine.update(wine_params)
      redirect_to @wine, notice: "Wine was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /wines/1
  def destroy
    @wine.destroy!
    redirect_to wines_path, notice: "Wine was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def wine_params
      params.expect(wine: [ :name, :year, :xl_id, :comment, :ticket, :aged, :color, :variety, :volume, :titration, :organic, :note, :bottling ])
    end
end
