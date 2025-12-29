class EventsController < ApplicationController
  before_action :set_wine, only: %i[ show edit update destroy ]

  def index
    @events = Event.includes(:drinks).order(start_date: :desc)
  end

  def show
  end

  def new
    @event = Event.new
    @event.purchase_items << @event.purchase_items.build(wine_id: params[:wine_id])
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      attach_pictures
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @event.update(event_params)
      attach_pictures
      redirect_to @event, notice: "Event was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @event.destroy!
    redirect_to events_path, notice: "Event was successfully destroyed.", status: :see_other
  end

  private

  def set_wine
    @event = Event.find(params.expect(:id))
  end

  def event_params
    params.expect(event: [ :name, :start_date, :end_date, :comment, { drinks_attributes: [[:_destroy, :id, :comment, :note, :wine_id, :location_id, pictures: []]] } ])
  end

  def attach_pictures
  # params[:event][:purchase_items_attributes].each do |purchase_item_attribute|
  #   return if purchase_item_attribute[:pictures].blank?

  #   @event.pictures.attach(purchase_item_attribute[:pictures])
  end
end
