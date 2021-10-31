class ProverbMedium
  FOR_WANT = "For want of a %s the %s was lost.\n".freeze
  LAST_PHRASE = 'And all for the want of a %s.'.freeze
  PAIR_SIZE = 2

  def initialize(*chain, qualifier: nil)
    @chain = chain
    @qualifier = qualifier ? "#{qualifier} #{chain.first}": chain.first
  end

  def to_s
    chain.each_cons(PAIR_SIZE).collect { |pair| FOR_WANT % pair }.join + LAST_PHRASE % qualifier
  end

  attr_reader :chain, :qualifier
end

chain = %w[nail shoe horse rider message battle kingdom]
proverb = ProverbMedium.new(*chain, qualifier: 'horseshoe')
expected = "For want of a nail the shoe was lost.\n" \
            "For want of a shoe the horse was lost.\n" \
            "For want of a horse the rider was lost.\n" \
            "For want of a rider the message was lost.\n" \
            "For want of a message the battle was lost.\n" \
            "For want of a battle the kingdom was lost.\n" \
            'And all for the want of a horseshoe nail.'

puts(proverb.to_s == expected)
