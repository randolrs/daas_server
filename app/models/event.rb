class Event < ApplicationRecord
  has_many :event_occurrences
  after_create :initiate_event_occurences

  def schedule(start)
    schedule = IceCube::Schedule.new(start)
    case recurrence
      when "weekly"
        schedule.add_recurrence_rule(
          IceCube::Rule.weekly.day(initialDate.wday)
        )
      when "weekdays"
        schedule.add_recurrence_rule(
          IceCube::Rule.weekly.day(:monday, :tuesday, :wednesday, :thursday, :friday)
        )
      when "monthly"
        schedule.add_recurrence_rule(
          IceCube::Rule.monthly.day_of_month(initialDate.mday)
        )
      when "daily"
        schedule.add_recurrence_rule(
          IceCube::Rule.daily
        )
    end
    schedule
  end

  def create_next_occurrences(count)
    schedule(Time.now).next_occurrences(count).each do |occurrence|
      EventOccurrence.create!(
        event_date: occurrence,
        event: self,
        description: description
      )
    end
  end

  def initiate_event_occurences
    create_next_occurrences(10)
  end

  def model_name
    'event_occurrences'
  end
end
