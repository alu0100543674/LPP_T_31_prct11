module QuestionExamen
  
	# Estructura de un nodo (valor, siguiente, anterior)
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
        		@nivel <=> other.nivel
    		end
    		
    		def == (other)
				@nivel == other.nivel && @question == other.question
			end
	end 
	
	
	# Clase List
	class List
    
    	include Enumerable
    	
		attr_accessor :cabeza, :tail
     
		# Initialize
		def initialize()
    			@cabeza = nil
    			@tail = nil
		end

    	# Añadir un nodo
     	def push(nodo)
			# Si cabeza no apunta a ningun nodo
       			if @cabeza == nil
	 			@cabeza = nodo
	 			@tail = nodo
			# Si cabeza apunta a un nodo
       			else 
					nodo.next = @cabeza
					@cabeza.anterior = nodo
					@cabeza = nodo
					nodo.anterior = nil
	   			end
   		end
        
		# Extraer 
    	def pop()
			# Si hay mas de un nodo en la lista
	  		if (@cabeza != @tail)
	   			aux = @cabeza
	   			@cabeza = @cabeza.next
	   			@cabeza.anterior = nil
	   			aux.next = nil
	   			aux.value
			# Si solo hay un nodo en la lista
	  		else
	   			@cabeza = nil
	   			@tail = nil
	  		end
    	end
     
		# Añadimos un nodo por el final
    	def push_final(nodo)
			# Si tail no apunta a ningun nodo
       		if @tail == nil
	 			@tail = nodo
	 			@cabeza = nodo
			# Si tail apunta a un nodo
       		else
	  			@tail.next = nodo
	  			nodo.anterior = @tail
	  			@tail = nodo
       		end
    	end
     
		# Extraemos por el final
     	def pop_final()
			# Si hay mas de un nodo en la lista
       		if (@cabeza != @tail)
	    		aux = @tail
	    		@tail = @tail.anterior
	    		@tail.next = nil
	    		aux.anterior = nil
	    		aux.value
			# Si solo hay un nodo en la lista
	  		else
	    		@cabeza = nil
	    		@tail = nil
	  		end
     	end
     		
        # Metodo each
     	def each 
     		nodo = @head
     		while (nodo != @tail) do
     			yield nodo.value
     			nodo = nodo.next
     		end
     	end
     
     	def add_many(values)
     		values.each do |x|
     			add(x)
     		end
     	end
     	
end
  
  	# Clase SeleccionSimple que hereda de Pregunta
  	class SeleccionSimple < Pregunta
    
    	attr_accessor :right, :distractor
    
		# Initialize
    	def initialize(question, right, distractor, nivel)
      		super(question, nivel)      
      		@right, @distractor = right, distractor
      	end
    
    	# Mostrar por pantalla
    	def to_s
      		opcion = @distractor+[@right]
      		s= ' '
     		opcion.each do |opcion|
	
			s += %Q{#{opcion}\n}
	
      		end
	 		"#{@question}\n#{s}\n"
    	end  
    
 	end
  
	# Clase VerdaderoFalso que hereda de Pregunta
	class VerdaderoFalso < Pregunta
    
    	attr_accessor :right, :wrong
    
		# Initialize
    	def initialize(question, right, wrong, nivel)
     		super(question, nivel)      
      		@right, @wrong = right, wrong
      	end
    
    	# Mostrar por pantalla
    	def to_s
      		opcion = @right+[@wrong]
      		s= ' '
      		opcion.each do |opcion|
	
			s += %Q{#{opcion}\n}
	
      		end
	 		"#{@question}\n#{s}\n"
    	end  
    
  	end 
  	
	class Examen
		attr_accessor :preguntas
		def initialize(listaPreguntas)
			@npreguntas = listaPreguntas
		end
		
		def insertQuestion(question)
			nodo = Nodo.new(question)
			nodoInsertado = @preguntas.push(nodo)
			nodoInsertado.value
		end
		
		def to_s
			aux = @preguntas.cabeza
			respuesta = ""
			respuesta += aux.value.to_s
			respuesta += "\n"
			while (aux != @preguntas.tail) do
				aux = aux.next
				respuesta += aux.value.to_s
				respuesta += "\n"
			end
			respuesta
		end
	end
 		
	class Interface
		attr_reader :examen
		def initialize(examen)
			@examen = examen
		end
		
		def compresp(resp)
			ok = 0
			index = 0
			num = 0
			while n < 5 do
				if @examen[i] == resp[i]
					ok += 1
				end
				index += 1
				num += 1
			end
			
			if ok < (index/2)+1
				p = "Suspendido: #{ok}/#{i}"
			else
				if ok == index
					p = "Nota: 10"
				else
					p = "Aprobado: #{correctas}/#{i}"
				end
			end
			p
		end
	end
end