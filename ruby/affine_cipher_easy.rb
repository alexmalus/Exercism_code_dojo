class Affine
  MOD_M = 26
  CYPHER_SET_SIZE = 5

  def initialize(key1, key2)
    @key1 = key1
    @key2 = key2

    raise ArgumentError, "Error: #{key1} and #{MOD_M} must be coprime." unless coprime?
  end

  def encode(text)
    encrypted_text = compile_text(text, encode: true)
    encrypted_text.size > CYPHER_SET_SIZE ? encrypted_text.each_slice(CYPHER_SET_SIZE).collect(&:join).join(' ') : encrypted_text.join
  end

  def decode(text)
    compile_text(text, encode: false).join
  end

  private

  def compile_text(text, encode:)
    clean_text = text.gsub(/\s/, '').downcase.gsub(/[^a-zA-Z0-9]/, '')
    clean_text.chars.collect { |char| char_considered_digits(char, encrypt: encode) }
  end

  def char_considered_digits(char, encrypt:)
    return char if ('0'..'9').include?(char)

    char_at(encrypt ? encrypt(char) : decrypt(char))
  end

  def index(char)
    ('a'..'z').to_a.index(char)
  end

  def char_at(idx)
    ('a'..'z').to_a[idx]
  end

  def encrypt(char)
    (key1 * index(char) + key2) % MOD_M
  end

  def decrypt(char)
    mmi * (index(char) - key2) % MOD_M
  end

  def coprime?
    mmi.positive?
  end

  def mmi
    (1..MOD_M).find { |mmi| key1 * mmi % MOD_M == 1 }.to_i
  end

  attr_reader :key1, :key2
end
