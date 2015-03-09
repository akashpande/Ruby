def compare(string_1,string_2)
    if string_1==string_2
       puts "Strings are equal"
    else
       puts "Strings are not equal"
    end
end


puts "Enter the String to be compared with"
string_1=gets.chomp


puts "Enter the string to be compared"
string_2=gets.chomp

compare(string_1,string_2)
