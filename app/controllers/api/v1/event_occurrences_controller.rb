class API::V1::EventOccurrencesController < ApplicationController
  respond_to :json

  def index
    @event_occurrences = EventOccurrence.all

    # render json: {
    #   status: 200,
    #   results: @event_occurrences,
    #   included: @event_occurrences.map(&:event),
    #   total: @event_occurrences.count
    # }

    # meta = {
    #   total: @event_occurrences.count
    # }

    # respond_with(@event_occurrences, each_serializer: ::EventOccurrenceSerializer, meta: meta)

    render json: @event_occurrences, each_serializer: ::EventOccurrenceSerializer # has nested event in response
  end

  def show
    @event_occurrence = EventOccurrence.find(params[:id])

    if @event_occurrence
      render json: {
        status: 200,
        event_occurrences: @event_occurrence
      }
    else
      render json: {
        status: 404,
      }
    end
  end

  private

  def event_occurrences_params
    # params.require(:attributes).permit(:name, :description, :date, :time, :website, :initialDate, :recurrence)
  end
end
