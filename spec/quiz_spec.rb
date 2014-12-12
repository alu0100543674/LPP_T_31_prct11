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
	  				
	  			question "En Ruby los bloques son objetos que contienen codigo",
	  			wrong => 'Cierto',
	  			right => 'Falso'
			}
  		end
	

	context " #Expectativas para la clase QuizZ" do
      		it " #Debe pertenercer @q a la clase QuizZ" do
				expect(@q.class).to eq(QuizZ)
    			end
       
       		it " #Debe tener un metodo to_s" do
				expect(@q.class).to respond_to :to_s
      		end
      		
      		it " #Debe tener un metodo to_s" do
				expect(@q.name).to eq("Cuestionario de LPP 05/12/2014")
      		end
 
    
    		it " #Debe tener un metodo q" do
				expect(@q).to respond_to :q
      		end
      		
      		it " #Debe tener un metodo wrong" do
				expect(@q).to respond_to :wrong
      		end
      		
      end

    end

end
