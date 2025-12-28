class OperationsController < ApplicationController

  def index
    @operations = Operation.includes(:location, :wine, :source)
                               .order(created_at: :desc)
  end

  private
end
