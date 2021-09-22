class Nucleotide
  VALID_NUCLEOTIDES = 'ATCG'.freeze

  def self.from_dna(dna)
    raise ArgumentError if /[^#{VALID_NUCLEOTIDES}]/ =~ dna

    new(dna)
  end

  def initialize(dna)
    @histogram = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
    dna.chars.each { |char| @histogram[char] = dna.count(char) }
  end

  def count(char)
    @histogram[char]
  end

  attr_reader :histogram
end
