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
    
 
