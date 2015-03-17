  # 1) Write a ruby program which accept input as file path.
  # Constraint : will accept only ruby files.
  #           write a RegEx to grep all defined variables like (global, local, class, instance) from given ruby file.
  
  # Output : print all variables with there type count.



  class Parser
  	def parse
  	  puts "Please Enter the path of file you want to parse"
  	  file_path = gets.chomp.to_s

  	  if !file_path.match /.*(\.rb)/
  	  	puts "Enter Valid Path"
  	  	return
  	  end

  	  input_file = File.open(file_path)
  	  global_var = Array.new
  	  local_var = Array.new
  	  class_name = Array.new
  	  instance_var = Array.new

  	  input_file.each do |current_line|
  	  	if current_line.strip.match /^\$\w+/
  	  	  global_var.push(current_line.strip.match /^\$\w*/.to_s)
  	  	end

  	  	if current_line.strip.match /^@@\w+/
  	  	  class_name.push(current_line.strip.match /^@@\w*/.to_s)
  	  	end  	

  	  	if current_line.strip.match /^@{1}\w+/
  	  	  instance_var.push(current_line.strip.match /^@{1}\w+/.to_s)
  	  	end

  	  	if current_line.strip.match /(^)\w+\s={1}/
  	  	  local_var.push(current_line.strip.match /(^)\w+\s={1}/.to_s)
  	  	end

  	  end		  	

  	  #print "global variables are: #{global_var} \t count: #{global_var.size}"
  	  puts "instance variables are :"
  	  instance_var.each do |single_instance_var|
  	  	puts single_instance_var
  	  end	
  	  
  	  puts "\nglobal variables are :"
  	  global_var.each do |single_global_var|
  	    puts single_global_var
  	  end   
  	  
  	  puts "\nclass varibles are :"
   	  class_name.each do |single_class_name|
  	  	puts single_class_name
  	  end
  	  	
   	  puts "\ninstance variables are :"
  	  local_var.each do |single_local_var|
  	  	puts single_local_var
  	  end
  	  	
  	end
  	input_file.close
  end

  parser = Parser.new
  parser.parse	  	


