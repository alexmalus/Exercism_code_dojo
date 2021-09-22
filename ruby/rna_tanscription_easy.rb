# TOSELF, great example, so KEYWORDS: scan | match | regex
# https://ruby-doc.org/core-3.0.2/String.html#method-i-tr
class Complement
  DNA = 'CATG'.freeze
  RNA = 'GUAC'.freeze

  def self.of_dna(nucleotide)
    nucleotide.tr(DNA, RNA)
  end
end
