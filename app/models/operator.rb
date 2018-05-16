class Operator

  def calculate(string)
    string_array = string.split(/(\*|\/|\+|\-)/)
    if index = string_array.reject(&:empty?).index{|c| c =~ /(\*|\/)/ }
      new_string = operate(string_array, index)
      calculate(new_string)
    elsif index = string_array.reject(&:empty?).index{|c| c =~ /(\+|\-)/ }
      return string if index == 0
      new_string = operate(string_array, index)
      calculate(new_string)
    else
      return string
    end
  end

  def operate(array, operator_index)
    operator = array[operator_index]
    left_operand = array[operator_index -1]
    right_operand = array[operator_index +1]
    value = evaluate(left_operand, right_operand, operator)
    sub_string = "#{left_operand}#{operator}#{right_operand}"
    new_string = array.join().gsub(sub_string, value.to_s)
  end

  def evaluate(left_operand, right_operand, operator)
    case operator
    when '+' then left_operand.to_f + right_operand.to_f
    when '-' then left_operand.to_f - right_operand.to_f
    when '*' then left_operand.to_f * right_operand.to_f
    when '/' then (left_operand.to_f / right_operand.to_f).round(2)
    end
  end
end
