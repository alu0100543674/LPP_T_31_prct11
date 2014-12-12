require 'spec_helper'
require "./lib/examen/quiz.rb"

module DSL
	describe DSL::QuizZ do
    		before :each do
			@q = DSL::QuizZ.new("Cuestionario de LPP 05/12/2014") {
				question '¿Cuantos argumentos de tipo bloque puede recibir un metodo?',
	    			right => '1',
	    			wrong => '2',
	    			wrong => 'muchos',
	  			wrong => 'los que defina el usuario'
	  				
	  			# question "En Ruby los bloques son objetos que contienen codigo",
	  			# wrong => 'Cierto',
	  			# right => 'Falso'
			}
  		end
	end
end
