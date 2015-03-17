
  require 'csv'

  module View
    def list_product
      puts "The list of products with all their details are"
      inventories = CSV.read("inventory.csv",headers:true)
		  
      inventories.headers.each do |current_header|
	print "#{ current_header } "
      end
		  
      print "\n\n"

      inventories.each do |current_inventory|
	current_inventory_text =  current_inventory.to_s.split(",")
		  
	current_inventory_text.each do | current_inventory_text_column |
	  print "#{current_inventory_text_column}  "
	end

      end

    end

    def search_product

      puts "Enter the name of product to search"
      product_search = gets.chomp.to_s
      inventories = CSV.read("inventory.csv",headers:true)
		  
      inventories.headers.each do |current_header|
	print "#{ current_header } "
      end
		  
      print "\n\n"
		  
      inventories.each do |current_inventory|

  	if current_inventory["product_name"].to_s == product_search
  	  current_inventory_text = current_inventory.to_s.split(",")
		  	  
  	  current_inventory_text.each do | current_inventory_text_column |
            print "#{ current_inventory_text_column }  "
	  end
		  	
	end
		  
      end	
    end 

  end


  class Shopkeeper

    include View
    def add_product
      inventories = CSV.read("inventory.csv",headers:true)
      if inventories.count == 0
	    CSV.open("inventory.csv", "a+") do |csv|
          csv << ["product_id","product_name","product_price","product_stock","product_company"]
     	end 
      end         	

      product_id = inventories.to_a.last[0].to_i + 1
          
      puts "Please Enter The Product Details"
      puts "Enter name of the product"
      product_name = gets.chomp.to_s
      puts "Enter price of the product"
      product_price = gets.chomp.to_i
      puts "Enter stock of the product"
      product_stock = gets.chomp.to_i
      puts "Enter company name of the product"
      product_company = gets.chomp.to_s

      CSV.open("inventory.csv", "a+") do |csv|
      	csv << ["#{product_id}","#{product_name}","#{product_price}","#{product_stock}","#{product_company}"]
       	puts "product added"
      end	
      

    end	

    def remove_product

      puts "Please Enter the id of product"
      product = gets.chomp.to_i
      required_product = nil
     	  
      temperory_file = CSV.open('temperory_file.csv','w')
	  inventories = CSV.open('inventory.csv')
		  
	  inventories.each do |current_inventory|
	    if current_inventory[0].split(",").first.to_i == product
	      next
	    end
        temperory_file << current_inventory
	  end
	  File.delete('inventory.csv')
	  File.rename('temperory_file.csv','inventory.csv')
	  inventories.close
	  temperory_file.close
	  puts "product removed"	
    
    end
    
    def edit_product
      puts "Enter the product id:"
	  product_id=gets.chomp.to_i
	  puts "Enter name of the product"
      product_name = gets.chomp.to_s
      puts "Enter price of the product"
      product_price = gets.chomp.to_i
      puts "Enter stock of the product"
      product_stock = gets.chomp.to_i
      puts "Enter company name of the product"
      product_company = gets.chomp.to_s
          
      temperory_file = CSV.open('temperory_file.csv','w')
	  inventories = CSV.open('inventory.csv')
		  
	  inventories.each do |current_inventory|
	    if current_inventory["product_id"] == product_id
 		  current_inventory[0]="#{product_id} #{product_name} #{product_price} #{product_stock} #{product_company}"
	    end
	    temperory_file << current_inventory
	  end
	  File.delete('inventory.csv')
	  File.rename('temperory_file.csv','inventory.csv')
	  inventories.close
	  temperory_file.close
  	  puts "product edited"    

    end

  end

  class Customer

  	include View

  	def buy_product
  	  puts "Please Enter the product id"
  	  product_id = gets.chomp.to_i
  	  puts "Please enter your name"
      customer_name = gets.chomp.to_s
  	  puts "Please enter your credit card number"
  	  customer_credit_card = gets.chomp.to_i
  	  puts "Please enter your cvv number"
  	  customer_cvv = gets.chomp.to_i
  	

   	  CSV.open("orders.csv", "a+") do |csv|
        csv << ["#{product_id}","#{customer_name}","#{customer_credit_card}","#{customer_cvv}"]
      end

      CSV.open("temperory_file.csv", "a+") do |csv|
          csv << ["product_id","product_name","product_price","product_stock","product_company"]
     	end 
     	  
      temperory_file = CSV.open("temperory_file.csv","a+",headers:true)

	  inventories = CSV.open("inventory.csv",headers:true)	  
	  inventories.each do |current_inventory|

	    if current_inventory["product_id"].to_i == product_id && current_inventory["product_stock"] 
	      current_inventory["product_stock"] = current_inventory["product_stock"].to_i - 1
	    end
        temperory_file << current_inventory
	  end
	  File.delete("inventory.csv")
	  File.rename("temperory_file.csv","inventory.csv")
	
	  inventories.close
	  temperory_file.close

	  puts "Thank you for buying the product"
  	
  	end  

  end	


  puts "enter 1 if user is shopkeeper \nor\nenter 2 if user is customer"
  option = gets.chomp.to_i

  case option
    when 1
      shopkeeper = Shopkeeper.new
 		 
      puts "enter 1 if you want to add the product"
      puts "enter 2 if you want to remove the product"
	  puts "enter 3 if you want to list the product"
	  puts "enter 4 if you want to search the product"
	  puts "enter 5 if you want to edit the product"

	  shopkeeper_option = gets.chomp.to_i 
      case shopkeeper_option
        when 1
          shopkeeper.add_product	
        when 2
          shopkeeper.remove_product	
        when 3	
          shopkeeper.list_product
 		when 4	
 		  shopkeeper.search_product
	    when 5
	      shopkeeper.edit_product	
	    else
	      puts "Enter Valid Option"	
	  end	
 	
    when 2
      customer = Customer.new
      puts "enter 1 if you want to list the product"
	  puts "enter 2 if you want to search the product"
	  puts "enter 3 if you want to buy the product"

	  customer_option = gets.chomp.to_i 
      case customer_option
        when 1
          customer.list_product
        when 2
          customer.search_product
        when 3
          customer.buy_product    	

    else
      puts "Enter Valid Option"
    end  	
  end
