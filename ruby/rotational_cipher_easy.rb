# Caesar
class RotationalCipher
  ABC = ('a'..'z').to_a.join

  def self.rotate(content, times)
    cipher_abc = ('a'..'z').to_a.rotate(times).join
    content.tr("#{ABC}#{ABC.upcase}", "#{cipher_abc}#{cipher_abc.upcase}")
  end
end
