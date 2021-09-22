class TwelveDays
  DAILY_GIFTS = {
    0 => ['first', "a Partridge in a Pear Tree.\n"],
    1 => ['second', 'two Turtle Doves'],
    2 => ['third', 'three French Hens'],
    3 => ['fourth', 'four Calling Birds'],
    4 => ['fifth', 'five Gold Rings'],
    5 => ['sixth', 'six Geese-a-Laying'],
    6 => ['seventh', 'seven Swans-a-Swimming'],
    7 => ['eighth', 'eight Maids-a-Milking'],
    8 => ['ninth', 'nine Ladies Dancing'],
    9 => ['tenth', 'ten Lords-a-Leaping'],
    10 => ['eleventh', 'eleven Pipers Piping'],
    11 => ['twelfth', 'twelve Drummers Drumming']
  }.freeze

  def self.song
    new.compose_lyrics
  end

  def compose_lyrics
    gifts = []
    lyrics = []

    DAILY_GIFTS.size.times do |i|
      gifts.unshift(DAILY_GIFTS[i][1])
      composed_lyric = "On the #{DAILY_GIFTS[i][0]} day of Christmas my true love gave to me: "

      the_gifts = gifts.size == 1 ? gifts.first : "#{gifts[0..-2].join(', ')}, and #{gifts[-1]}"
      lyrics << composed_lyric + the_gifts
    end

    lyrics.join("\n")
  end
end
