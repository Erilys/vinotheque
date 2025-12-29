class SearchWinesController < ApplicationController
  before_action :filter_location
  before_action :filter_color
  before_action :filter_variety
  before_action :filter_year
  before_action :filter_name
  before_action :get_wines
  before_action :filter_from_wines

  def search; end

  def search_params
    return ActionController::Parameters.new.permit if params['search'].blank?

    params.require(:search)
          .permit([location_id: [], name: [], year: [], color: [], variety: []])
  end
  helper_method :search_params

  def filter_location
    @selected_location_ids = search_params.fetch('location_id', []).map(&:to_i)

    @locations = Location.distinct.joins(:stocks).order(:name)
  end

  def filter_year
    @selected_years = search_params.fetch('year', []).map(&:to_i)

    @years = all_wines_in_stock.pluck(:year).uniq.sort
  end

  def filter_color
    @selected_colors = search_params.fetch('color', [])

    @colors = all_wines_in_stock.pluck(:color).uniq.sort
  end

  def filter_variety
    @selected_varietys = search_params.fetch('variety', [])

    @varietys = all_wines_in_stock.pluck(:variety).compact.uniq.sort
  end

  def filter_name
    @selected_names = search_params.fetch('name', [])

    @names = all_wines_in_stock.pluck(:name).uniq.sort
  end

  def get_wines
    @wines = all_wines_in_stock
    @wines = @wines.where(stocks: { location_id: @selected_location_ids }) if @selected_location_ids.any?
    @wines = @wines.where(name: @selected_names) if @selected_names.any?
    @wines = @wines.where(year: @selected_years) if @selected_years.any?
    @wines = @wines.where(color: @selected_colors) if @selected_colors.any?
    @wines = @wines.where(variety: @selected_varietys) if @selected_varietys.any?
    @wines = @wines.to_a
  end

  def filter_from_wines
    # @colors = @colors.filter{ |color| @wines.map(&:color).include? color } if @selected_colors.blank?
    # @years = @years.filter{ |year| @wines.map(&:year).include? year } if @selected_years.blank?
    # @names = @names.filter{ |name| @wines.map(&:name).include? name } if @selected_names.blank?
  end

  private

  def all_wines_in_stock
    # Preload associations stocks and locations,
    # but excludes wines without stocks.
    @all_wines_in_stock ||= Wine.joins(stocks: :location)
                                .order(:name)
  end
end
