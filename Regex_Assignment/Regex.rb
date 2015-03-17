  # The assignment for RegEx.
  # 2) Check if the pattern "ss" appears in the string "Mississippi".
  # 3) Print out the 3rd word of each sentence from a list of sentences.
  # 4) Find and replace all instances of "Mrs" with "Ms" in a sentence.
  # 5) Does a string start with "St"?
  # 6) Does a string end with "art"?
  # 7) Does a string have non-alphanumeric characters in it?
  # 8) Are there any whitespace characters in the string?
  # 9) Find and replace all non-alphanumeric characters in a string with "-".
  class RegularExpression
    def ss_finder
      puts "Please Enter the string"
      input_string = gets.chomp.to_s
      if input_string.match /ss/
        puts "Match successfull"
      else
        puts "Match not successfull"
      end 
    end 

    def mrs_replacer
      puts "Please enter the sentence containg Mrs in it"
      input_string = gets.chomp.to_s
      if input_string.match /Mrs/
        changed_string = input_string.gsub(/Mrs/,"Ms")
        puts "The Changed string is :\n#{changed_string}"
      else
        puts "Your sentence do not contain Mrs"
      end 
    end

    def st_starter
      puts "Enter the string"
      input_string = gets.chomp.to_s
      if input_string.match /^St/
        puts "#{input_string} start with St"
      else
        puts "#{input_string} does not start with St"
      end 
    end 

    def art_ender
      puts "Enter the string"
      input_string = gets.chomp.to_s
      if input_string.match /.*art\z/
        puts "#{input_string} ends with art"
      else
        puts "#{input_string} does not end with art"
      end 
    end

    def non_alphanumeric_char_finder
      puts "Enter the string"
      input_string = gets.chomp.to_s
      if input_string.match /[^a-zA-Z0-9]/
        puts "#{input_string} contains alpha-numeric characters"
      else
        puts "#{input_string} do not contain alpha-numeric characters"
      end 
    end 

    def whitespace_char_finder
      puts "Enter the string"
      input_string = gets.chomp.to_s
      if input_string.match /\s/
        puts "#{input_string} contains whitespace characters"
      else
        puts "#{input_string} do not contain whitespace characters"
      end 
    end

    def non_alphanumeric_char_replacer
      puts "Enter the string"
      input_string = gets.chomp.to_s
      if input_string.match /[^a-zA-Z0-9]/
      	changed_string = input_string.gsub(/[^a-zA-Z0-9]/,"-")
        puts "changed string string is :\n#{changed_string}"
      else
        puts "#{input_string} do not contain alpha-numeric characters"
      end 
    end

    def third_string_finder
      puts "Enter a passage. To stop press x"
      
      while true
        input_string = gets.chomp.to_s
        if input_string == "x"
          puts "Your passage ends here"
          break
        end
        
        if input_string.match /\s*\w+\s\w+\s\w+/
          required_matcher = input_string.match /\s*\w+\s\w+\s\w+/
          required_string = required_matcher.to_s.split(" ").last
          puts "Third word is : #{required_string}"
        end  
         
      end 

    end  
	 	
  end


    	
  regexpr = RegularExpression.new

  regexpr.ss_finder
  regexpr.mrs_replacer
  regexpr.st_starter
  regexpr.art_ender
  regexpr.non_alphanumeric_char_finder
  regexpr.whitespace_char_finder
  regexpr.non_alphanumeric_char_replacer
  regexpr.third_string_finder
