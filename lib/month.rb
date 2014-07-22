require_relative '../lib/zellers'

class Month

  def initialize(month, year)
    @month = month
    @year = year
  end

  def header #displays the month and year, centered above the days
    "#{name} #{@year}".center(20).rstrip
  end

  def weekdays #displays the weekdays (Su Mo Tu We Th Fr Sa) under the month and year
    "Su Mo Tu We Th Fr Sa"
  end

  def name #names of the months
    months = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    months[@month]
  end

  def month_length #determines how many days in a month depending on which month is entered
    case @month
    when 2
      leap_year? ? 29 : 28
    when 4, 6, 9, 11
      30
    else
      31
    end
  end

  def leap_year? #determines if the year entered is a leap year
    if (@year % 400 == 0)
      true
    elsif (@year % 100 == 0)
      false
    elsif (@year % 4 == 0)
      true
    else
      false
    end
  end

  def month_day_start #determines which day a month starts on
    day_start = ZellersCongruence.calculate(name, 1, @year)
  end

  def weeks_in_a_month
    #makes an array of the days in a month, replaces 0 with a space if the # of the day < 10
    weeks_array = ("01".."#{month_length}").to_a
    weeks_array.each do |day|
      day.gsub!(/0/, "\s") if day < "10"
    end

    #sets the index for the days
    month_day_start_index = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    index = month_day_start_index.index(month_day_start)

    #for each index, add 2 spaces to the beginning of the array and add spaces to the end of the array until there are a total of 42
    index.times do
      weeks_array.unshift "\s\s"
    end
    until weeks_array.length == 42
      weeks_array.push "\s\s"
    end

    #makes the final array for a month
    final_weeks_array = []
    6.times do |week|
      final_weeks_array << "#{(weeks_array[week * 7, 7].join("\s"))}"
    end
    final_weeks_array
  end

  #puts the header with year and month and the weekdays along with the month array
  def to_s
    output = "#{header}\n"
    output << "#{weekdays}\n"
    weeks_in_a_month_rstrip = weeks_in_a_month.collect{ |week| week.rstrip }
    output << "#{weeks_in_a_month_rstrip.join("\n")}\n"
    output
  end

  def to_a
    output = []
    output << "#{name}".center(20)
    output << "#{weekdays}"
    output.concat(weeks_in_a_month)
  end
end
