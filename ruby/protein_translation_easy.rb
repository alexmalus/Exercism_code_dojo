# TOSELF, great example, so KEYWORDS: scan | match | regex
# Here, scan is used to split a string into X chunks.
class Translation
  INVALID_PROTEIN = 'STOP'.freeze
  PROTEIN_TO_CODON = { 'Methionine' => %w[AUG], 'Phenylalanine' => %w[UUU UUC], 'Leucine' => %w[UUA UUG],
                       'Serine' => %w[UCU UCC UCA UCG], 'Tyrosine' => %w[UAU UAC],
                       'Cysteine' => %w[UGU UGC], 'Tryptophan' => %w[UGG], INVALID_PROTEIN => %w[UAA UAG UGA] }.freeze
  CODON_SIZE = 3

  def self.of_codon(codon)
    PROTEIN_TO_CODON.each { |protein, codon_set| break protein if codon_set.include?(codon) }
  end

  def self.of_rna(strand)
    codons = strand.scan(/.{#{CODON_SIZE}}/)
    unless codons.all? { |codon| PROTEIN_TO_CODON.values.flatten.include?(codon) }
      raise InvalidCodonError, 'Invalid Strand provided'
    end

    proteins = []
    codons.each do |codon|
      protein = Translation.of_codon(codon)

      break if protein == INVALID_PROTEIN

      proteins << protein
    end

    proteins
  end
end

class InvalidCodonError < StandardError
end

strand = 'CARROT'
Translation.of_rna(strand)
