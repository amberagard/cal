require_relative '../lib/month'

class Year
  def initialize(year)
    @year = year
  end

  def header
    "#{@year}".center(62).rstrip
  end

  def group_months(first, second, third)
    first = Month.new(first, @year).to_a
    second = Month.new(second, @year).to_a
    third = Month.new(third, @year).to_a
    group = first.zip(second, third)
    group.collect{|m| m.join("\s\s").rstrip}.join("\n")
  end

  def to_s
    output = "#{header}\n\n"
    output << "#{group_months(1, 2, 3)}\n"
    output << "#{group_months(4, 5, 6)}\n"
    output << "#{group_months(7, 8, 9)}\n"
    output << "#{group_months(10, 11, 12)}\n"
  end
end
