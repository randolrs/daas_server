class Event < ApplicationRecord
  has_many :event_occurrences
  before_create :initiate_event_occurences

  DAYS_OF_THE_WEEK = {
    "Sunday": :sunday,
    "Monday": :monday,
    "Tuesday": :tuesday,
    "Wednesday": :wednesday,
    "Thursday": :thursday,
    "Friday": :friday,
    "Saturday": :saturday,
  }.freeze

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

  def initiate_event_occurences
    puts '***888 8 8 8 ' * 100
    puts schedule(Time.now)
    puts schedule(Time.now).first(10)

    schedule(Time.now).first(10).each do |occurrence|
      puts ' 6dd66d 0 0 0' * 10
      puts occurrence
      puts self.inspect
      puts description
      puts ' -- --- - - ' * 10
      EventOccurrence.create(
        event_date: occurrence,
        # :event => self,
        description: description
      )
    end

  end
end
