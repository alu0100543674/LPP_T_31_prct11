require 'spec_helper'
require "./lib/examen/lista.rb"


module QuestionExamen
    
    # Expectativas de la clase Pregunta
    describe QuestionExamen::Pregunta do	  
	  before :each do
	    @pregunta1 = QuestionExamen::Pregunta.new('3 + 7 =', 0)
	  end	  
	    
	  context " #Clase Preguntas" do
	    it " # Debe tener un campo para la pregunta" do
	      expect(@pregunta1.question) == '3 + 7 ='
	    end
	    
	    it " #Debe tener un campo para el nivel de dificultad" do
	      expect(@pregunta1.nivel) == 0
	    end
	  end	    
    end
    
 

 # Expectativas  para la clase seleccion simple
    describe QuestionExamen::SeleccionSimple do	  
	  before :each do
	     @p1 = QuestionExamen::SeleccionSimple.new('¿Cual es el tipo del objeto en el siguiente codigo Ruby? class Objeto \n end', "c) Un Objeto \n", ["a) Una instancia de la clase Class \n ", "b) Una constante \n", "d) Ninguna de las anteriores \n"], 4)
	     @node1 = Node.new(@p1,nil)	    
	     @p4 = QuestionExamen::SeleccionSimple.new('¿Cual es la salida del siguiente codigo en Ruby? class Xyz \n def pots \n @nice \n end \n end', "b) nil \n", ["a) #<Xyz:0xa000208> \n ", "c) 0 \n", "d) Ninguna de las anteriores \n"], 2)
	     @node4 = Node.new(@p4, nil)
	   end	
	  
	  context " #Clase SeleccionSimple" do
	    it " #Debe ser de la clase SeleccionSimple" do
               expect(@p1.class) ==  SeleccionSimple       
	    end
	    
	    it " #Comprobar herencia de la clase SeleccionSimple" do
	    	expect(@p1.is_a? QuestionExamen::SeleccionSimple).to eq(true)
	    end
	    
	    it " #Comprobar instancia de SeleccionSimple" do
	    	expect(@p1).to be_an_instance_of (QuestionExamen::SeleccionSimple)
	    end
	    
	    it " #Debe tener un enunciado heredado de la clase Pregunta" do
               expect(@p1.question) == '¿Cual es el tipo del objeto en el siguiente codigo Ruby? class Objeto \n end'	       
	    end
	    
	    it " #Debe tener una respuesta correcta" do
               expect(@p1.right) == 'c) Un Objeto \n'	       
	    end	
        
        it " #Debe tener unas opciones incorrectas" do
               expect(@p1.distractor) == ["a) Una instancia de la clase Class \n ", "b) Una constante \n", "d) Ninguna de las anteriores \n"]	       
	    end	
	    
	    it " #Debe tener un metodo to_s" do
               expect(@p1).to respond_to :to_s       
	    end	
	    
	    it " #Se compara la dificultad de la pregunta usando <" do
	    	(@p1 < @p4).should eq(false)
	    end
	    
	    it " #Se compara la dificultad de la pregunta usando >" do
	    	(@p1 > @p4).should eq(true)
	    end
	    
	    it " #Se compara la dificultad de la pregunta usando =" do
	    	(@p1 == @p4).should eq(false)
	    end
	    
	    it " #Se compara la dificultad de la pregunta usando >=" do
	    	(@p1 >= @p4).should eq(true)
	    end
	    
	    it " #Se compara la dificultad de la pregunta usando <=" do
	    	(@p1 <= @p4).should eq(false)
	    end
	end	
end



	# Expectativas para la clase VerdaderoFalso
    describe QuestionExamen::VerdaderoFalso do	  
	  before :each do
	      @p2 = QuestionExamen::VerdaderoFalso.new("Es apropiado que una clase Tablero herede de una clase Juego \n", "Verdadero \n",
 				 	"Falso \n", 8)
	      @node2 = Node.new(@p2,nil)	
	      @p3 = QuestionExamen::VerdaderoFalso.new('La siguiente definicion de un hash en Ruby es valida: \n hash_raro = { \n [1, 2, 3] => Object.new(), \n Hash.new => :toto \n }', "b) Falso \n", ["a) Verdadero \n"], 9)
	      @node3 = Node.new(@p3,nil)	 
	  end	  
	  
	  context "Pruebas para la clase de Verdadero y Falso" do
	    it " #Debe ser de la clase VerdaderoFalso" do
               expect(@p2.class) ==  VerdaderoFalso      
	    end
	    
	    it " #Comprobar herencia de la clase VerdaderoFalso" do
	    	expect(@p2.is_a? QuestionExamen::VerdaderoFalso).to eq(true)
	    end
	    
	    it " #Comprobar instancia de SeleccionSimple" do
	    	expect(@p2).to be_an_instance_of (QuestionExamen::VerdaderoFalso)
	    end
	    
	    it " #Debe tener un enunciado heredado de la clase Pregunta" do
               expect(@p2.question) == 'Es apropiado que una clase Tablero herede de una clase Juego \n'	       
	    end
	    
	    it " #Debe tener una respuesta correcta" do
               expect(@p2.right) == 'Verdadero \n'	       
	    end	
        
        it " #Debe tener unas opciones incorrectas" do
               expect(@p2.wrong) == 'Falso \n'	       
	    end	
	    it " #Debe tener un metodo to_s" do
               expect(@p2).to respond_to :to_s       
	    end		    
	    
	    it " #Se compara la dificultad de la pregunta usando <" do
	    	(@p2 < @p3).should eq(true)
	    end
	    
	    it " #Se compara la dificultad de la pregunta usando >" do
	    	(@p2 > @p3).should eq(false)
	    end
	    
	    it " #Se compara la dificultad de la pregunta usando =" do
	    	(@p2 == @p3).should eq(false)
	    end
	    
	    it " #Se compara la dificultad de la pregunta usando >=" do
	    	(@p2 >= @p3).should eq(false)
	    end
	    
	    it " #Se compara la dificultad de la pregunta usando <=" do
	    	(@p2 <= @p3).should eq(true)
	    end
	    
	  end	    
    end
    
     # Expecativas para la clase List
     describe QuestionExamen::List do	  
	  before :each do
	      @lista=QuestionExamen::List.new()
	      @lista.push(@node1)
	      @lista.push(@node2)
 	      @lista.push(@node3)
	      @lista.push(@node5)
	      	      
	  end	  
	  
	  context "Pruebas para Node y Lista" do
	        it " #Debe ser de la clase List" do
                 expect(@lista.class) ==  List       
	        end
	    	
	    	it " #Debe existir un Nodo de la lista con sus datos, su siguiente y su anterior" do
	         expect(@lista.cabeza != nil && @lista.next == nil && @lista.anterior == nil) 
	    	end

			it " #Se deben insertar nodos en la lista" do
                @lista.push(@node1)
                expect(@lista.cabeza).to eq(@node1)
            end
                
            it " #Se insertan varios elementos por el principio" do
                @lista.push(@node1)
                @lista.push(@node2)
                expect(@lista.cabeza).to eq(@node2)
            end
		
			it " #Se insertan varios elementos por el final" do
                @lista.push_final(@node1)
                @lista.push_final(@node2)
                expect(@lista.cabeza).to eq(@node1)
            end

	        it " #Se extrae el primer elemento de la lista" do
		    	@lista.push(@node1)
                @lista.push(@node2)
                @lista.pop
                expect(@lista.cabeza).to eq(@node1)	
	        end
		
			it " #Se extrae el ultimo elemento de la lista" do
		    	@lista.push_final(@node1)
                @lista.push_final(@node2)
                @lista.pop_final
                expect(@lista.cabeza).to eq(@node1)	
	        end
		
			it " #Se inserta por el final de la lista" do
		    	@lista.push_final(@node1)
                @lista.push_final(@node2)
                expect(@lista.cabeza).to eq(@node1)	
	        end
	        
	  		it " #Comprobamos que se puede hacer un each" do
	  			@lista.each{|i| yield i}
			end
	  end
	  
    end
    


end
 
    
