class Atbash
  ABC = ('a'..'z').to_a.join

  def self.encode(input)
    input.downcase.delete('^a-z0-9').tr(ABC, ABC.reverse)
         .chars.each_slice(5).map(&:join).join(' ')
  end

  def self.decode(input)
    input.delete(' ').tr(ABC.reverse, ABC)
  end
end
