class Bob
  def self.hey(remark)
    new(remark).respond
  end

  def initialize(remark)
    @remark = remark.gsub(/\s/, '')
  end

  def respond
    return NO_WORDS if remark.empty?

    if asked_question?
      yelled? ? YELL_QUESTION : ASK_QUESTION
    else
      yelled? ? YELL : REMAINING_VOCABULARY
    end
  end

  private

  NO_WORDS = 'Fine. Be that way!'.freeze
  YELL_QUESTION = "Calm down, I know what I'm doing!".freeze
  ASK_QUESTION = 'Sure.'.freeze
  YELL = 'Whoa, chill out!'.freeze
  REMAINING_VOCABULARY = 'Whatever.'.freeze

  def yelled?
    remark.match(/[a-z]/i) && remark == remark.upcase
  end

  def asked_question?
    remark.end_with?('?')
  end

  attr_reader :remark
end
