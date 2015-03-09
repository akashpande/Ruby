begin

puts "press 1 to manipulate String"
puts "press 2 to manipulate Array"
puts "press 3 to manipulate Hash"
option=gets.chomp.to_i
case(option)
	when 1
		puts "Enter the string"
		input_string=gets.chomp.to_s

		puts "the string in upper case is:"
                puts input_string.upcase

		puts "the string in reverse order is:"
		puts input_string.reverse

		puts "enter the start index from which you want to slice"
		beg_index=gets.chomp.to_i
		puts "enter the end index till which you want to slice the string"
		end_index=gets.chomp.to_i
		puts input_string.slice(beg_index..end_index)

		puts "enter another string to concat with the existing"
		string_cat=gets.chomp.to_s
		puts input_string.concat(string_cat)

		puts "the string in swap case is:"
		puts input_string.swapcase
	when 2
		name = []
		puts "Enter the 7 names "
		7.times do |x|
		name[x] = gets.chomp
                end
                for i in name
		print i, " "
		end
		puts "sorted array is:"
		puts name.sort.display

		puts "reversed array is:"
		puts name.reverse.display

		puts "enter the element to delete from array"
		delete_element=gets.chomp.to_s
                name.delete(delete_element)
		puts name.display

		puts "array about to pop"
                name.pop
		puts name.display

		puts "array about to shift"
		name.shift
		puts name.display
	when 3
		marks={"akash"=>98,"sudeep"=>81,"vaibhav"=>65,"rakesh"=>76,"dhiraj"=>67}
		marks.display

                puts "adding a new element in the hash"
                puts marks.store("rahul",45)
	
		puts "sorted hash is"
		print marks.sort
		
		puts "inverted hash is:"
		inverted_hash=marks.invert
		puts inverted_hash

		puts "merging the hashes"
		puts marks.merge!(inverted_hash)
		
		puts "Converting hash into array"	
		print marks.flatten(2)
		
        else
		puts "Enter correct option"
	end
end	
