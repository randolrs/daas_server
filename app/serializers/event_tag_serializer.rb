# @model EventTag

class EventTagSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
end
