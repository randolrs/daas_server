class API::V1::EventsController < ApplicationController
  def create
    @event = Event.new(event_params)
    if @event.save
      render json: {
        status: :created,
        event: @event
      }
    else
      render json: {
        status: 500,
        errors: @event.errors.full_messages
      }
    end
  end

  private

  def event_params
    params.require(:attributes).permit(:name, :description, :date, :time, :website)
  end
end
