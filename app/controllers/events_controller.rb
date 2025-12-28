class EventsController < ApplicationController
  before_action :set_wine, only: %i[ show edit update destroy ]

  def index
    @events = Event.includes(:transactions).order(start_date: :desc)
  end

  def show
  end

  def new
    @event = Event.new
    @event.transactions << @event.transactions.build(wine_id: params[:wine_id])
  end

  def edit
  end

  def create
    @event = Event.new(wine_params)

    if @event.save
      attach_pictures
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @event.update(wine_params)
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

  def wine_params
    params.expect(event: [ :name, :start_date, :end_date, :comment, { transactions_attributes: [%i[_destroy id location_id quantity wine_id]] } ])
  end

  def attach_pictures
    return if params[:event][:pictures].blank?

    params[:event][:pictures].each { |picture| @event.pictures.attach(picture) }
  end
end
