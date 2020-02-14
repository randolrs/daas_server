class EventTag < ApplicationRecord
  has_many :events_event_tags
  has_many :events, :through => :events_event_tag
end
