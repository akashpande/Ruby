  class KnightTour	
	  @solution

	  def initialize
		  @n=8
		  @solution=Array.new(@n) { Array.new(@n,-1)  }
	  end

	  def isSafe(x,y)
		  if x >= 0 and x < @n and y >= 0 and y < @n and @solution[x][y] == -1
			  return true
		  else		
			  return false
		  end			 	
	  end

	  def nextMove(x,y,current_move,xMove,yMove)
		  if current_move == @n * @n
			  return true
		  end	
		  for index in 0...@n
			  next_x = x + xMove[index]
			  next_y = y + yMove[index]
			  if isSafe(next_x,next_y)
				  @solution[next_x][next_y] = current_move
				  if(nextMove(next_x,next_y,current_move + 1,xMove,yMove)==true)
					  return true
				  else
					  @solution[next_x][next_y] = -1	
   				  end						    
			  end

		  end		   	
		  return false
	  end


	  def solve
	      xMove = [ 2, 1, -1, -2, -2, -1, 1, 2 ]
          yMove = [ 1, 2, 2, 1, -1, -2, -2, -1 ]
          @solution[0][0] = 0
          if nextMove(0,0,1,xMove,yMove) == false
        	  puts "solution does not exist"
        	  return false
          else
        	  print @solution
          end
          return true		
	  end	

  end
  kn=KnightTour.new
  kn.solve

