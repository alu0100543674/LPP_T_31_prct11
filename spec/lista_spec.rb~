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
	    	(@p1.nivel < @p4.nivel).should eq(false)
	    end
	    it " #Se compara la dificultad de la pregunta usando >" do
	    	(@p1.nivel > @p4.nivel).should eq(true)
	    end
	    it " #Se compara la dificultad de la pregunta usando =" do
	    	(@p1.nivel == @p4.nivel).should eq(false)
	    end
	    it " #Se compara la dificultad de la pregunta usando >=" do
	    	(@p1.nivel >= @p4.nivel).should eq(true)
	    end
	    it " #Se compara la dificultad de la pregunta usando <=" do
	    	(@p1.nivel <= @p4.nivel).should eq(false)
	    end
	   
	    
	    
	  end	
  
	     
    
    end
    
