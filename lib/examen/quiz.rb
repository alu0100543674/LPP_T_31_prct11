# Modulo para la practica 11
module DSL
	
	# Clase Quiz
	class Quiz
    	attr_reader :title, :op_ans

		# Initialize
    	def initialize (title, op_ans)
        	@title, @op_ans = title, op_ans
    	end
	end
	
	# Clase QuizZ
	class QuizZ 
  
  		RIGHT = :right
  		WRONG = :wrong
  
  		attr_accessor :name, :preg

		# Initialize
  		def initialize(name, &block)
    		@name, @preg = name, []
		end
	end
	
end