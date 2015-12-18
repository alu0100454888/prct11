

module Bib



  	class Referencia

	include Comparable	# ahora debemos definir el metodo <=>
			attr_accessor :autores, :titulo, :serie, :editorial, :numEdicion, :fecha, :numISBN


		def initialize(a,b,c,d,e,f,g)
			@autores = a
			@titulo = b
			@serie = c 
			@editorial = d
			@numEdicion = e
			@fecha = f
			@numISBN = g
		end

	
		def obtenerAutores()
			return @autores
		end

		def obtenerTitulo()
			return @titulo
		end

		def obtenerSerie()
			return @serie
		end

		def obtenerEditorial()
			return @editorial
		end


		def obtenerFechaPub()
			return @fecha
		end

		def obtenerNumEdicion()
			return @numEdicion
		end



		def obtenerNumIsbn()
			return @numISBN
		end

		def obtenerRefer()
			"#{autores.join(", ")}.\n#{titulo}\n(#{serie})\n#{editorial}; #{numEdicion} edicion #{fecha}\n#{numISBN.join("\n")}"

		end

		#Definimos el metodo por incluir el modulo Comparable
		#Devuelve true o false, podemos usar [].sort
		def <=>(other)
      			return nil unless other.is_a? Reference
      			if autores == other.autores then
      				if date == other.fecha
      					titulo <=> other.titulo
      				else 
      					fecha <=> other.fecha
      				end
      				else
      					autores<=> other.autores
      				end
			end
		end

#Estructura del nodo compuesta por la informacion, un puntero a siguiente y un puntero a anterior
Node = Struct.new(:value, :next, :anterior)



#Clase Lista de nodos	
class Lista 

	include Enumerable

	attr_accessor :cabeza, :tail

	#constructor 
	def initialize()
		@cabeza = nil
		@tail = nil
	end



	#--------------------------------	
	def each 

		temp = @cabeza
		while (temp != @tail) do
			yield temp.value
			temp = temp.next
		end
	end
	#----------------------------------


	




	#Se extrae el primer elemento de la lista
	def pop_ini ()
				
		if(@cabeza == @tail)
			@cabeza = nil
			@tail = nil

		else			
			aux = @cabeza
			@cabeza = @cabeza.next
			@cabeza.anterior = nil
			aux.value

		end		
	end


	def pop_fin()	
		if (@cabeza == @tail)
			@cabeza = nil
			@tail = nil
		else
			aux = @tail
	    		@tail = @tail.anterior
	    		@tail.next = nil
	    		aux.anterior = nil
	    		aux.value   
		end
	end



	#Insertar por principio
	def push_ini (nodo) 
		a = Node.new(nodo, nil)
		#si la lista esta vacia
		if @cabeza == nil
			@cabeza = nodo
			@tail = nodo

		#si la lista no esta vacia
		else 
			nodo.next = @cabeza
			@cabeza.anterior = nodo
			@cabeza = nodo
			nodo.anterior=nil
		end
	end


	#Insertar por final
	def push_fin(nodo)
		
		if @tail == nil
			@tail =nodo
			@cabeza = nodo
		else
			@tail.next = nodo
			nodo.anterior = @tail
			@tail = nodo
		end
	end

	
end


	def valueGet()
		return @cabeza.value
	end

#Creada jerarquia de clases para representar libros y publicaciones periodicas


class Libro < Referencia

	def initialize(a,b,c,d,e,f,g)
		super(a,b,c,d,e,f,g)
	end
end



class Periodico < Referencia

	def initialize(a,b,c,d,e,f,g)
		super(a,b,c,d,e,f,g)
	end
end



class ArticuloPeriodico < Periodico

	def initialize(a,b,c,d,e,f,g)
		super(a,b,c,d,e,f,g)
	end
end


class ArticuloRevista < Periodico

	def initialize(a,b,c,d,e,f,g)
		super(a,b,c,d,e,f,g)
	end
end



class DocumentoElectronico < Periodico

	def initialize(a,b,c,d,e,f,g)
		super(a,b,c,d,e,f,g)
	end
end


#******************************************************************

class Apa 


	def initialize()
		@Lista = Lista.new
	end



	def insertarReferencia(referencia)
		@Lista.push_ini(referencia)

	end 

	def pop_fin()
		if (@cabeza == @tail)
			@cabeza = nil
			@tail = nil
		else
			aux = @tail
	    		@tail = @tail.anterior
	    		@tail.next = nil
	    		aux.anterior = nil
	    		aux.value   
		end
	end



	def autor_APA(autor)
		name_parts = autor.split - [" "]
      		first_name, last_name = name_parts[0], name_parts[-1]
      		last_name + ", " + first_name
    	end



	def print_autor
      		count = 0
      		lista = ""
      		autores.each do |autor|
        	count += 1
        	lista += autor_rev(autor)
        	lista += " & " if count != autores.size
     	 end
      		lista
    	end



 	def print_isbn
      		lista = ""
      		num_isbns.each do |isbn|
        	count = 0
        	lista += "ISBN-" + isbn.delete('^0-9').size.to_s + ": " + isbn
        	lista += "\n" if count != num_isbns.size
      	end
      		lista
    	end


	def to_s
      "#{print_autor}\n#{titulo}\n#{serie}\n#{editorial}; #{num_edicion} #{fecha_publicacion}\n#{print_isbn}"
    end

	
	

end

	





puts "ALL OK!!"


#*******************************************************************





#******************************************************************

end


