module Calculate
   def calculate_percentage(secured_marks,total_marks)
      percentage=(secured_marks/total_marks.to_f)*100
      puts(percentage)
   end
   def calculate_simple_interest(principal,interest_rate,period)
       simple_interest=(principal*interest_rate*period)/100
       puts(simple_interest)
   end
end

class Score
   include Calculate
end

class Interest
   include Calculate
end




puts "Press 1 to calculate percentage or press 2 to calculate simple interest"
option=gets.chomp.to_i


case(option)
   when 1
       puts "Enter Total Marks Secured in all subjects"
       secured_marks=gets.chomp.to_i
       puts "Enter Total Marks of the subjects"
       total_marks=gets.chomp.to_i
       score=Score.new
       puts "Percentage scored is:"
       score.calculate_percentage(secured_marks,total_marks)
   when 2
       puts "Enter the Principal"
       principal=gets.chomp.to_i
       puts "Enter  interest rate"
       interest_rate=gets.chomp.to_i
       puts "Enter the period"
       period=gets.chomp.to_i
       interest=Interest.new
       puts "The Simple interest is:"
       interest.calculate_simple_interest(principal,interest_rate,period) 	
   else
       puts "Incorrect Option"
   end

