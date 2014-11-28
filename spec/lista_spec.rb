	# encoding: UTF-8
	
	require 'spec_helper'
	require "./lib/examen/lista.rb"
	
	module Test
		describe Test::Pregunta do	  
		  	before :each do
				@q = Test::Pregunta.new('3 + 7 =')
				@q1 = Test::Pregunta.new('3 + 8 =')
		  	end	  
		    
		  	context " #Expectativas para la clase Preguntas" do
		    	it " #Debe tener un campo para la pregunta q" do
		      		expect(@q.quest) == '3 + 7 ='
		    	end
		    	
		    	it " #Debe tener un campo para la pregunta q1" do
		      		expect(@q1.quest) == '3 + 8 ='
		    	end
		  	end	    
	    end
	    
	    
	    describe Test::Simple do	  
		  	before :each do
		  		@p1 = Test::Simple.new("Cual es el tipo del objeto en el siguiente codigo Ruby? class Objeto \n end", "c) Un Objeto \n", ["a) Una instancia de la clase Class \n ", "b) Una constante \n", "d) Ninguna de las anteriores \n"])
		     	@node1 = Node.new(@p1,nil,nil)	
		      	@p2 = Test::Simple.new("class Array \n def say_hi \n HEY! end end \n p[1,, bob].say_hi \n", "a) Ninguna de las anteriores", ["b) 1 \n", "c) bob \n", "d) HEY! \n", "e) otramas \n"])
		      	@node2 = Node.new(@p2,nil,nil)
		        @p3=Test::Simple.new("Salida class Xyz \n def pots\n @nice\n end\nend\n","a) nil", ["b) #<Xyz:0x00000002bf0ed0> \n","c) 0 \n ", "d) ninguna de las anteriores \n" ])
				@node3 = Node.new(@p3,nil,nil)
			end	
		  
		  	context " #Expectativas para la clase Seleccion" do
		  		# Expectativas para p1
		    	it " #Debe ser de la Clase Simple" do
	            	expect(@p1.class) ==  Simple       
		    	end
		    
				it " #Debe tener un campo quest heredado de Pregunta" do
	               expect(@p1.quest) == 'Cual es el tipo del objeto en el siguiente codigo Ruby? class Objeto \n end'	       
		    	end
		    
		    	it " #Debe tener un campo con la respuesta correcta" do
	               expect(@p1.right) == 'c) Un Objeto \n'	       
		    	end	
		    
	            it " #Debe tener opciones incorrectas" do
	               expect(@p1.distractor) == ["a) Una instancia de la clase Class \n ", "b) Una constante \n", "d) Ninguna de las anteriores \n"]	       
		    	end	
		    
				it " #Debe tener un metodo to_s" do
	               expect(@p1).to respond_to :to_s       
		    	end	
		    	
		    	# Expectativas para p2
		    	it " #Debe ser de la Clase Simple" do
	            	expect(@p2.class) ==  Simple       
		    	end
		    
				it " #Debe tener un campo quest heredado de Pregunta" do
	               expect(@p2.quest) == 'class Array \n def say_hi \n HEY! end end \n p[1,, bob].say_hi \n'	       
		    	end
		    
		    	it " #Debe tener un campo con la respuesta correcta" do
	               expect(@p2.right) == 'a) Ninguna de las anteriores'	       
		    	end	
		    
	            it " #Debe tener opciones incorrectas" do
	               expect(@p2.distractor) == ["b) 1 \n", "c) bob \n", "d) HEY! \n", "e) otramas \n"]	       
		    	end	
		    
				it " #Debe tener un metodo to_s" do
	               expect(@p2).to respond_to :to_s       
		    	end	
		    
		    	# Expectativas para p3
		    	it " #Debe ser de la Clase Simple" do
	            	expect(@p3.class) ==  Simple       
		    	end
		    
				it " #Debe tener un campo quest heredado de Pregunta" do
	               expect(@p3.quest) == 'Salida class Xyz \n def pots\n @nice\n end\nend\n'	       
		    	end
		    
		    	it " #Debe tener un campo con la respuesta correcta" do
	               expect(@p3.right) == 'a) nil'	       
		    	end	
		    
	            it " #Debe tener opciones incorrectas" do
	               expect(@p3.distractor) == ["b) #<Xyz:0x00000002bf0ed0> \n","c) 0 \n ", "d) ninguna de las anteriores \n"]	       
		    	end	
		    
				it " #Debe tener un metodo to_s" do
	               expect(@p3).to respond_to :to_s       
		    	end	
		    
		    	# Expectativas para comparar
		    	it " #Debe poderse comprobar que p1 tiene menos opciones erroneas que p4" do
					expect(@p1 < @p2).to eq(true)
		    	end
		    
		    	it " #Debe poderse comprobar que p1 tiene igual opciones erroneas que p4" do
					expect(@p1 == @p3).to eq(true)
		    	end
		    
		    	it " #Debe poderse comprobar que p1 tiene mas opciones erroneas que p4" do
					expect(@p2 > @p3).to eq(true)
		    	end
		    	
		    	it " #Debe poderse comprobar que p1 tiene mas o igual opciones erroneas que p4" do
					expect(@p2 >= @p3).to eq(true)
		    	end
		    	
		    	it " #Debe poderse comprobar que p1 tiene menos o igual opciones erroneas que p4" do
					expect(@p2 <= @p3).to eq(false)
		    	end
		    end	    
	    end
	    
	 
	
	    describe Test::TrueFalse do	  
		  	before :each do
		      	@pr2=Test::TrueFalse.new("Es apropiado que una clase Tablero herede de una clase Juego \n", "Verdadero \n", "Falso \n")
		      	@node2 = Node.new(@p2,nil,nil)
				@pr3=Test::TrueFalse.new("Salida class de hash_raro = {[1, 2, 3] => Object.new(),Hash.new => :toto}", "Verdadero \n", "Falso \n")
			    @node3 = Node.new(@p3,nil,nil)
		  	end	  
	
			context "Pruebas para la clase de Verdadero y Falso" do
				# Expectativas para la pregunta pr2
		    	it " #Debe ser de la clase Simple" do
	            	expect(@pr2.class) ==  TrueFalse      
		    	end
		    
				it " #Debe tener un campo quest heredado de Pregunta" do
	               expect(@pr2.quest) == 'Es apropiado que una clase Tablero herede de una clase Juego \n'	       
		    	end
		    
		    	it " #Debe tener una respuesta correcta" do
	               expect(@pr2.right) == 'Verdadero \n'	       
		    	end
		    
	            it " #Debe tener unas opciones incorrectas" do
	               expect(@pr2.wrong) == 'Falso \n'	       
		    	end
		    
		    	it " #Debe tener un metodo to_s" do
	               expect(@pr2).to respond_to :to_s       
		    	end
		    	
		    	# Expectativas para la pregunta pr3
		    	it " #Debe ser de la clase Simple" do
	            	expect(@pr3.class) ==  TrueFalse      
		    	end
		    
				it " #Debe tener un campo quest heredado de Pregunta" do
	               expect(@pr3.quest) == 'Salida class de hash_raro = {[1, 2, 3] => Object.new(),Hash.new => :toto}'	       
		    	end
		    
		    	it " #Debe tener una respuesta correcta" do
	               expect(@pr3.right) == 'Verdadero \n'	       
		    	end
		    
	            it " #Debe tener unas opciones incorrectas" do
	               expect(@pr3.wrong) == 'Falso \n'	       
		    	end
		    
		    	it " #Debe tener un metodo to_s" do
	               expect(@pr3).to respond_to :to_s       
		    	end
		    
		    	# Expectativa para comparar las preguntas
				it " #Comprueba que la pregunta pr2 tenga las mismas opciones correctas que la pregunta pr3" do
					expect(@pr2 == @pr3).to eq(true)
				end
				
				it " #Comprueba que la pregunta pr2 tenga las mismas opciones correctas que la pregunta pr3" do
					expect(@pr2 >= @pr3).to eq(true)
				end
				
				it " #Comprueba que la pregunta pr2 tenga menos o igual opciones correctas que la pregunta pr3" do
					expect(@pr2 <= @pr3).to eq(true)
				end
				
				it " #Comprueba que la pregunta pr2 tenga menos opciones correctas que la pregunta pr3" do
					expect(@pr2 < @pr3).to eq(false)
				end
				
				it " #Comprueba que la pregunta pr2 tenga mas opciones correctas que la pregunta pr3" do
					expect(@pr2 > @pr3).to eq(false)
				end
		  	end	    
	    end
	    
	    describe Test::ListaEnlazada do	  
			before :each do
		    	@lista = Test::ListaEnlazada.new()
		      	@lista.push(@node1)
		      	@lista.push(@node2)	      
		  	end	  
		  
			context " #Expectativas para la clase ListaEnlazada" do
		        it " #Debe ser de la clase ListaEnlazada" do
	                 expect(@lista.class) ==  ListaEnlazada       
		        end
		    
		    	it " #Debe existir un Nodo de la lista con sus datos, su siguiente y su anterior" do
		        	expect(@lista.cabeza != nil && @lista.next == nil && @lista.anterior == nil) 
		       	end
		       
		        it " #Debe insertar nodos en la lista" do
	                @lista.push(@node1)
	                expect(@lista.cabeza).to eq(@node1)
	            end
	                
	            it " #Debe insertar varios elementos por el principio" do
	                @lista.push(@node1)
	                @lista.push(@node2)
	                expect(@lista.cabeza).to eq(@node2)
	            end
			
				it " #Debe insertar varios elementos por el final" do
	                @lista.push_final(@node1)
	                @lista.push_final(@node2)
	                expect(@lista.cabeza).to eq(@node1)
	            end
	
		        it " #Debe extraer el primer elemento de la lista" do
			    	@lista.push(@node1)
	                @lista.push(@node2)
	                @lista.pop
	                expect(@lista.cabeza).to eq(@node1)	
		        end
			
				it " #Debe extraer el ultimo elemento de la lista" do
			    	@lista.push_final(@node1)
	                @lista.push_final(@node2)
	                @lista.pop_final
	                expect(@lista.cabeza).to eq(@node1)	
		        end
			
				it " #Debe insertar por el final de la lista" do
			    	@lista.push_final(@node1)
	                @lista.push_final(@node2)
	                expect(@lista.cabeza).to eq(@node1)	
		        end
			
				it " #Debe poderse hacer un each" do
			    	@lista.each{|i| yield i}
				end
	    	end
	    end
end
