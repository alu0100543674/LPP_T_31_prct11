module Test
    # Estructura de un nodo
    Node = Struct.new(:value, :next , :anterior) #define una estructura indicando los campos que contendrá
  
    # Clase Pregunta
    class Pregunta
    
        include Comparable
    
        attr_accessor :quest
    
        def initialize(quest)
            @quest = quest
        end
    end
  
    # Clase Lista
    class ListaEnlazada
    
        include Enumerable
    
        attr_accessor :cabeza, :tail
    
        def initialize()
            @cabeza = nil
            @tail = nil
        end
  
        def each
            nodo = @cabeza
            while (nodo) do
	            yield nodo.value
                nodo = nodo.next
            end
        end
    
        def reverse_each
            nodo=@tail
            while (nodo) do
	            yield nodo
    	        nodo=nodo.anterior
            end
        end
    
        def top
            @cabeza
        end
    
        def push(nodo)
            if @cabeza == nil
	            @cabeza = nodo
	            @tail = nodo
            else 
	            nodo.next = @cabeza
        	    @cabeza.anterior = nodo
        	    @cabeza = nodo
            	nodo.anterior = nil
            end
        end
        
        def pop()
	        if (@cabeza != @tail)#si la lista tiene mas de un elemento
	            aux = @cabeza
	            @cabeza = @cabeza.next
	            @cabeza.anterior = nil
	            aux.next = nil
	            aux.value
	        else
	            @cabeza = nil
	            @tail = nil
	        end
        end
     
        def push_final(nodo)
            if @tail == nil
	            @tail = nodo
	            @cabeza = nodo
            else
	            @tail.next = nodo
	            nodo.anterior = @tail
	            @tail = nodo
            end
        end
     
        def pop_final()
            if (@cabeza != @tail)#si la lista tiene mas de un elemento
	            aux = @tail
	            @tail = @tail.anterior
	            @tail.next = nil
	            aux.anterior = nil
	            aux.value
	        else
	            @cabeza = nil
	            @tail = nil
	        end
        end
     
        def cont_nodos
            cont = 0
            n=@cabeza
            while (n != nil)do
	            cont += 1
	            n=n.next
            end
            return cont
        end
    end
  
    # Clase Simple que hereda de la clase Pregunta
    class Simple < Pregunta
    
        attr_accessor :right, :distractor
    
        def initialize(quest, right, distractor)
            super(quest)
            @right, @distractor = right, distractor
        end
    
        def <=>(other)
            distractor.size <=> other.distractor.size
        end

        def to_s
            op = @distractor + [@right]
            s = ' '
            op.each do |op|
	            s += %Q{#{op}\n}	
            end
            "#{@quest}\n#{s}\n"
        end  
    end 
  
  
    # Clase TrueFalse que hereda de la clase Pregunta
    class TrueFalse < Pregunta
    
        attr_accessor :right, :wrong
    
        def initialize(quest, right, wrong)
          super(quest)
          @right, @wrong = right, wrong
        end
    
        def <=>(other)
           right.size <=> other.right.size
        end
    
        def to_s
            op = @wrong + [@right]
            s = ' '
            op.each do |op|
	            s += %Q{#{op}\n}
	        end
	        "#{@quest}\n#{s}\n"
        end  
    
        def respuesta_correcta (eleccion)
	        if (eleccion == @right)
	            return true
	        else
	            return false
	        end 
        end
    end
    
     # Clase Examen
    class Examen
    
        include Enumerable
 
        attr_accessor :lista
      
        def initialize(lista)
	        @lista = lista
        end
    end
    
end