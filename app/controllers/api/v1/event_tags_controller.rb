class API::V1::EventTagsController < ApplicationController
  def create
    # @event = Event.new(event_params)
    # if @event.save
    #   render json: {
    #     status: :created,
    #     event: @event
    #   }
    # else
    #   render json: {
    #     status: 500,
    #     errors: @event.errors.full_messages
    #   }
    # end
  end

  def index
    # todo: add filters, add before_action helper
    render json: EventTag.all, each_serializer: ::EventTagSerializer
  end
end
