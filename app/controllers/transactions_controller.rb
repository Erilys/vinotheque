class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.includes(:location, :wine, :source)
                               .order(created_at: :desc)
  end

  private
end
