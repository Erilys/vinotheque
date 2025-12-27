class EntriesController < ApplicationController
  before_action :set_entry, only: %i[ show edit update destroy ]

  def index
    @entries = Entry.all.includes(:wine)
  end

  def show
  end

  def new
    @entry = Entry.new
    @entry.wine_id = params.fetch(:wine_id, nil)
  end

  def edit
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to @entry, notice: "Entry was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to @entry, notice: "Entry was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @entry.destroy!
    redirect_to entries_path, notice: "Entry was successfully destroyed.", status: :see_other
  end

  private

  def set_entry
    @entry = Entry.find(params.expect(:id))
  end

  def entry_params
    params.expect(entry: [ :quantity, :wine_id, :price_per_bottle_in_cents, :gift, :store, :new_store, :town ]).tap do |parameters|
      parameters[:store] = parameters[:new_store] if parameters[:new_store].presence
      parameters.delete :new_store
    end
  end
end
