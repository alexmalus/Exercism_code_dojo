class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation.new('Not supported') if !ALLOWED_OPERATIONS.include?(operation)

    begin
      first_operand.send(operation.to_sym, second_operand)
    rescue ZeroDivisionError
      'Division by zero is not allowed.'
    end
  end
end

class UnsupportedOperation < StandardError
end

print SimpleCalculator.calculate(22, 25, '+')
