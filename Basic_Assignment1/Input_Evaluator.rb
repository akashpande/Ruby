def evaluate(operand1,operator,operand2)
    evalStr=operand1.concat(operator).concat(operand2)
    calculated_value=eval(evalStr)
    puts "Calculated value is"
    puts calculated_value
end




puts "Enter first operand"
operand1=gets.chomp.to_s

puts "Enter second operand"
operand2=gets.chomp.to_s

puts "Enter operator"
operator=gets.chomp.to_s

evaluate(operand1,operator,operand2)   
