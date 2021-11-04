class ETL
  def self.transform(old)
    # https://ruby-doc.org/core-3.0.2/Enumerable.html#method-i-each_with_object
    old.each_with_object({}) do |(score, letters), new_score|
      letters.each { |letter| new_score[letter.downcase] = score }
    end
  end
end
