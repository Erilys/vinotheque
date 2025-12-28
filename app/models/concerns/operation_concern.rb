# frozen_string_literal: true

module OperationConcern
  extend ActiveSupport::Concern

  included do
    after_commit :refresh_stocks

    belongs_to :wine
    belongs_to :location
  end

  def refresh_stocks = Stock.refresh
end
