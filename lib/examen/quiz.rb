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
		
		# Mostrar
  		def to_s
    		m = "\n\n\n"
    		m << @name
    		m << "\n\n\n"
    		cont = 1
    		preg.each do |q|
     			m << " #{cont} => ) #{q}\n"
     			cont += 1
    		end
   			m
  		end

		# Le pasamos la pregunta y las opciones
  		def q(title, opc)
    		q = q.new(title, opc)
    		preg << q
  		end
  
  		# Contador para los fallos
  		def wrong 
    	    @cont += 1
   			"#{@cont} :"
		end
	end
	
end