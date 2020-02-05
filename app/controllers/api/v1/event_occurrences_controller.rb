class API::V1::EventOccurrencesController < ApplicationController
  def index
    @event_occurrences = EventOccurrence.all

    render json: {
      status: 200,
      results: @event_occurrences,
      total: @event_occurrences.count
    }
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
