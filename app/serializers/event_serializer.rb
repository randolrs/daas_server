class EventSerializer < ActiveModel::Serializer
  has_many :event_occurrences

  attributes :id, :name, :description
end
