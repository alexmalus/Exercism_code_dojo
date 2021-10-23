class Year
  def self.leap?(year)
    Date.leap?(year)
  end

  class Date
    def self.leap?(year)
      every4 = (year % 4).zero?
      new_century = (year % 100).zero?
      div_by400 = (year % 400).zero?

      every4 && !new_century || div_by400 ? true : false
    end
  end
end
