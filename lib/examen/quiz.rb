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
end