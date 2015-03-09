
def calculate_area(input_radius)
	area = 3.14159265 * input_radius * input_radius
	return area;
end


puts "Enter the radius of the circle"
radius=gets.chomp.to_f


area_circle=calculate_area(radius)
puts "Area of circle is #{area_circle}"
