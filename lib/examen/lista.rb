module QuestionExamen
  
	# Estructura de un nodo
  	Node = Struct.new(:value, :next , :anterior) 
  
	# Clase Pregunta
	class Pregunta
    
    		include Comparable
    
    		attr_accessor :question, :nivel
    		
    		
    		def initialize(question, nivel)
      			@question = question
      			@nivel = nivel
      		end
    
    		def <=> (other)
        		nivel <=> other.nivel
    		end
	end 
end