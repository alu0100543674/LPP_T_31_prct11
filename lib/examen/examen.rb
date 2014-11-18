class Examen
    attr_accessor :interfaz
    def initialize(interfaz)
       @interfaz = interfaz 
    end
    
    def answer()
       index = 0;
       STDOUT.flush
       while (i < @interfaz.size())
            puts @interfaz.next().to_s
            print "Respuesta: "
            comprobar = $stdin.gets.chomp
            if (@interfaz.answer(comprobar))
                puts 
            else
                puts
            end
            index += 1
        end
    end
end