# @model EventOccurrence

class EventOccurrenceSerializer < ActiveModel::Serializer
  belongs_to :event

  attributes :id, :event_date, :description

end
