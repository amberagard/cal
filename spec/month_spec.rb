require_relative '../lib/month'

RSpec.describe Month do
  context ".header" do
    it "matches cal for December 2012" do
      month = Month.new(12, 2013)
      month.header.should == "   December 2013"
    end

    it "matches cal for July 1901" do
      month = Month.new(07, 1901)
      month.header.should == "     July 1901"
    end
  end

  context ".name" do
    it "translates January" do
      Month.new(1, 2012).name.should == "January"
    end

    it "translates February" do
      Month.new(2, 2012).name.should == "February"
    end

    it "translates March" do
      Month.new(3, 2012).name.should == "March"
    end

    it "translates April" do
      Month.new(4, 2012).name.should == "April"
    end

    it "translates May" do
      Month.new(5, 2012).name.should == "May"
    end

    it "translates June" do
      Month.new(6, 2012).name.should == "June"
    end

    it "translates July" do
      Month.new(7, 2012).name.should == "July"
    end

    it "translates August" do
      Month.new(8, 2012).name.should == "August"
    end

    it "translates September" do
      Month.new(9, 2012).name.should == "September"
    end

    it "translates October" do
      Month.new(10, 2012).name.should == "October"
    end

    it "translates November" do
      Month.new(11, 2012).name.should == "November"
    end

    it "translates December" do
      Month.new(12, 2012).name.should == "December"
    end

    it "should have 31 days" do
      Month.new(8, 1934).month_length.should == 31
    end

    it "should have 29 days" do
      Month.new(2, 2576).month_length.should == 29
    end

    it "should have 30 days" do
      Month.new(11, 1876).month_length.should == 30
    end

    it "should have 28 days" do
      Month.new(2, 2005).month_length.should == 28
    end

    it "should start on a Wednesday" do
      Month.new(9, 2213).month_day_start.should == "Wednesday"
    end

    it "should" do
      Month.new(7, 2014).weeks_in_a_month.should == ["       1  2  3  4  5", " 6  7  8  9 10 11 12", "13 14 15 16 17 18 19", "20 21 22 23 24 25 26", "27 28 29 30 31      ", "                    "]
    end

  end
end
