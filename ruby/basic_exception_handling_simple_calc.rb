class SimpleCalculator
  ALLOWED_OPERATIONS = %w[+ / *].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation, 'Not supported' unless ALLOWED_OPERATIONS.include?(operation)
    raise ArgumentError unless [first_operand, second_operand].all? { |op| op.is_a?(Integer) }

    begin
      result = first_operand.send(operation.to_sym, second_operand)
      "#{first_operand} #{operation} #{second_operand} = #{result}"
    rescue ZeroDivisionError
      'Division by zero is not allowed.'
    end
  end

  class UnsupportedOperation < StandardError
  end
end
