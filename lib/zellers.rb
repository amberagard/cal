
class ZellersCongruence
  def self.calculate(month, day, year)
    months = ["March", "April", "May", "June", "July", "August", "September", "October", "November", "December", "January", "February"]
    days = ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    q = day
    m = months.index(month) + 3
    y = (m <= 12) ? year : year - 1
    k = y % 100
    j = y / 100
    h = (q + (13 * (m + 1)/5).floor + k + (k/4).floor + (j/4).floor + (5 * j)) % 7
    days[h]
  end
end
