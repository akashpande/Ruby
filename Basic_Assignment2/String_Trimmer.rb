print "Enter the string>"

input_string=gets.chomp.to_s

puts input_string
while(input_string.length != 1)
	input_string= input_string.chars.each_slice(2).map{|(a,b)|"#{a}"}.join
	puts input_string
end	
