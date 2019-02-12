##
# Esta clase representa la noción de la jugada ejecutada por el jugador.
class Jugada
	##
	# Crea una nueva instancia de jugada.

	# Si se instancia esta clase directamente el método to_s indica
	# que la clase no se instancio correctamente ya que esta clase
	# esta pensada para ser padre de otras subclases.
	def to_s
		'No se instancio correctamente'
	end
end

##
# Esta clase representa al elemento específico Piedra.
class Piedra < Jugada

	#
	# Crea una nueva instancia de Piedra.

	# Retorna la representación en String de la clase.
	def to_s
		'Piedra'
	end

	# Retorna una tupla de dos enteros con los ptos obtenidos 
	# dependiendo del tipo de jugada que se recibe como argumento.
	# El primer entero indica los puntos ganados por el elemento Piedra
	# y el segundo entero indica los puntos ganados por la jugada contraria
	def puntos(contrincante)
		x = contrincante.to_s()
		case x
		when 'Tijera'
			[1,0]
		when 'Papel'
			[0,1]
		when 'Lagarto'
			[1,0]
		when 'Spock'
			[0,1]
		when 'Piedra'
			[0,0]
		else
			"Error, no se recibio un contrincante valido"
		end
	end

end

##
# Esta clase representa al elemento específico Papel.
class Papel < Jugada

	#
	# Crea una nueva instancia de Papel.

	# Retorna la representación en String de la clase.
	def to_s
		'Papel'
	end

	# Retorna una tupla de dos enteros con los ptos obtenidos 
	# dependiendo del tipo de jugada que se recibe como argumento.
	# El primer entero indica los puntos ganados por el elemento Papel
	# y el segundo entero indica los puntos ganados por la jugada contraria.
	def puntos(contrincante)
		x = contrincante.to_s()
		case x
		when 'Tijera'
			[0,1]
		when 'Piedra'
			[1,0]
		when 'Lagarto'
			[0,1]
		when 'Spock'
			[1,0]
		when 'Papel'
			[0,0]
		else
			"Error, no se recibio un contrincante valido"
		end
	end
end

##
# Esta clase representa al elemento específico Tijera.

class Tijera < Jugada
	#
	# Crea una nueva instancia de Tijera.

	# Retorna la representación en String de la clase.
	def to_s
		'Tijera'
	end

	# Retorna una tupla de dos enteros con los ptos obtenidos 
	# dependiendo del tipo de jugada que se recibe como argumento.
	# El primer entero indica los puntos ganados por el elemento Tijera
	# y el segundo entero indica los puntos ganados por la jugada contraria.
	def puntos(contrincante)
		x = contrincante.to_s()
		case x
		when 'Piedra'
			[0,1]
		when 'Papel'
			[1,0]
		when 'Lagarto'
			[1,0]
		when 'Spock'
			[0,1]
		when 'Tijera'
			[0,0]
		else
			"Error, no se recibio un contrincante valido"
		end
	end
end

##
# Esta clase representa al elemento específico Lagarto.
class Lagarto < Jugada
	#
	# Crea una nueva instancia de Lagarto.

	# Retorna la representación en String de la clase.
	def to_s
		'Lagarto'
	end


	# Retorna una tupla de dos enteros con los ptos obtenidos 
	# dependiendo del tipo de jugada que se recibe como argumento.
	# El primer entero indica los puntos ganados por el elemento Lagarto
	# y el segundo entero indica los puntos ganados por la jugada contraria.
	def puntos(contrincante)
		x = contrincante.to_s()
		case x
		when 'Piedra'
			[0,1]
		when 'Papel'
			[1,0]
		when 'Tijera'
			[0,1]
		when 'Spock'
			[1,0]
		when 'Lagarto'
			[0,0]
		else
			"Error, no se recibio un contrincante valido"
		end
	end
end

##
# Esta clase representa al elemento específico Spock.
class Spock < Jugada
	#
	# Crea una nueva instancia de Spock.

	# Retorna la representación en String de la clase.
	def to_s
		'Spock'
	end

	# Retorna una tupla de dos enteros con los ptos obtenidos 
	# dependiendo del tipo de jugada que se recibe como argumento.
	# El primer entero indica los puntos ganados por el elemento Lagarto
	# y el segundo entero indica los puntos ganados por la jugada contraria.
	def puntos(contrincante)
		x = contrincante.to_s()
		case x
		when 'Piedra'
			[1,0]
		when 'Papel'
			[0,1]
		when 'Tijera'
			[1,0]
		when 'Lagarto'
			[0,1]
		when 'Spock'
			[0,0]
		else
			"Error, no se recibio un contrincante valido"
		end
	end
end

##
# Esta clase representa a un jugador y la manera en que este realiza las jugadas.
class Estrategia
	#
	# Crea una nueva instancia de Estrategia.

	#Esta es la semilla que se usara para todos los generadores de numeros al azar.
	@@semillaPadre = 42

	# Retorna el string indicando que no se instanció correctamente debido a que
	# esta clase esta pensada para agrupar a las estrategías especificas.
	def to_s
		'No se instancio correctamente'
	end
end

##
# Esta clase representa a un jugador usando la estrategia manual.
class Manual < Estrategia

	#
	# Crea una nueva instancia de la estrategia manual.

	#Llama a la función que recibe una jugada del usuario y devuelve la jugada asociada.
	def prox(j= nil)
		hacerJugada
	end

	# Retorna la representación en String que es el nombre simbólico de la clase
	def to_s
		'Estrategia Manual'
	end
end

##
# Esta clase representa a un jugador usando la estrategia Uniforme.
class Uniforme < Estrategia

	# Representa la lista de movimientos posibles del jugador.
	attr_accessor :listaMov

	# Representa el generador de numeros al azar cuya semilla 
	# es la semilla padre heredada de la clase Estrategia.
	attr_accessor :generador

	##
	# Crea una nueva instancia de la estrategia Uniforme.
	# Se recibe una lista de movimientos
	# Genera una excepción si la lista de movimientos posibles es vacía. 
	# Se eliminan los duplicados y se crea el generador de números al azar
	# usando la semilla padre.
	def initialize(listaMov)
		raise ArgumentError.new("La lista no puede ser vacia") if listaMov.length ==0
		listaMov.uniq!
    	@listaMov = listaMov
    	@generador = Random.new(@@semillaPadre)
    end

    # Retorna una instancia de algunas de las subclases de jugada 
	# representando la próxima jugada. Se elige al azar con la 
	# misma probabilidad cualquiera de las jugadas posibles.
	def prox(j= nil)

		item = @listaMov[self.generador.rand(listaMov.length)]
		item = item.to_s
		aux2 = Kernel.const_get(item).new
	end

	# Genera una representación en String de la estrategia.
	def to_s
		"Estrategia Uniforme \nSemilla = 42" 
	end
end

##
# Esta clase representa a un jugador usando la estrategia Sesgada.
class Sesgada < Estrategia

	# Representa el generador de numeros al azar cuya semilla 
	# es la semilla padre heredada de la clase Estrategia.
	attr_accessor :generador

	# Representa la lista cuya estructura representa el sesgo requerido.
	attr_accessor :listaSesgada
	# Representa la lista de movimientos posibles con hash 
	# a las probabilidades de obtener cada movimiento que el usuario decida.
	attr_accessor :listaMov

	##
	# Crea una nueva instancia de la estrategia Sesgada.
	# Se recibe una lista de movimientos junto con las probabilidades
	# de obtener cada una representado mediante un hash.
	# Genera una excepción si la lista de movimientos posibles es vacía. 
	# Se eliminan los duplicados, se crea el generador de números al azar
	# usando la semilla padre y además se genera una lista que representa
	# el sesgo clonando la cantidad de veces que sea necesario cada objeto para
	# simular el sesgo.
	def initialize(listaMov)
		raise ArgumentError.new("La lista no puede ser vacia") if listaMov.length ==0
		@listaMov = listaMov
		objetos = listaMov.keys
		repeticiones = listaMov.values
		@listaSesgada =[]
		@generador = Random.new(42)
    	for i in 0..listaMov.length-1
    		y=repeticiones[i]
    		for j in 0..y-1
    			listaSesgada.push(objetos[i])
    		end
    	end
    end

    # Retorna una instancia de alguna de las subclases de jugada 
	# representando la próxima jugada. Se elige al azar con la 
	# las probabilidades sesgadas indicadas por el usuario.
	def prox(j= nil)
		item = @listaSesgada[self.generador.rand(listaSesgada.length)]
		item = item.to_s
		aux2 = Kernel.const_get(item).new
	end

	# Genera una representación en String de la estrategia con el sesgo indicado por el usuario.
	def to_s
		valores = @listaMov.values
		total = valores.inject(0){|sum,x| sum + x }
		"Estrategia Sesgada con probabilidades: Piedra "+ self.formatearNumero(@listaMov[:Piedra],total) + " Papel " + self.formatearNumero(@listaMov[:Papel],total)+ " Tijera " + self.formatearNumero(@listaMov[:Tijera],total) + " Lagarto " + self.formatearNumero(@listaMov[:Lagarto],total) + " Spock " + self.formatearNumero(@listaMov[:Spock],total) + "\nSemilla = 42\n"
	end

	# Realiza el formato para imprimir la representacion en String de Sesgada.
	def formatearNumero(x,total)
		b = x.to_s
		c = total.to_s
		b + "/" + c
	end
end

##
# Esta clase representa a un jugador usando la estrategia Copiar.
class Copiar < Estrategia

	# representa las rondas jugadas por el usuario, se inicializa  en cero.
	attr_accessor :nro_jugada

	##
	# Crea una nueva instancia de la estrategia Copiar.
	# Se recibe la jugada del contrincante que realizó
	# la ronda anterior y se copia esta jugada retornando
	# la misma. Si se trata de la primera ronda, el jugador
	# debe introducir de forma manual la jugada.
	def initialize()
		@nro_jugada = 0
    end

    # Retorna una instancia de alguna de las subclases de jugada 
	# representando la próxima jugada. Se copia la jugada que realizó
	# el contrincante en la ronda anterior. Si se trata de la primera ronda
	# se introduce manualmente la jugada.
	def prox(j= nil)
		if j == nil
			@nro_jugada = 2
			hacerJugada()

		else
			return j
		end
	end

	# Genera una representación en String de la estrategia Copiar.
	def to_s
		"Estrategia Copiar"
	end
end

##
# Esta clase representa a un jugador usando la estrategia Pensar.
class Pensar < Estrategia

	# Representa la cantidad de veces que el contrincante ha jugado Piedra.
	attr_accessor :r

	# Representa la cantidad de veces que el contrincante ha jugado Papel.
	attr_accessor :p

	# Representa la cantidad de veces que el contrincante ha jugado Tijera.
	attr_accessor :t

	# Representa la cantidad de veces que el contrincante ha jugado Lagarto.
	attr_accessor :l

	# Representa la cantidad de veces que el contrincante ha jugado Spock.
	attr_accessor :s

	# Representa el generador de numeros al azar cuya semilla 
	# es la semilla padre heredada de la clase Estrategia.
	attr_accessor :generador

	##
	# Crea una nueva instancia de la estrategia Pensar.
	# Se recibe la jugada del contrincante que realizó
	# la ronda anterior y se agrega esta jugada a la lista
	# para analizar la frecuencia de juego del contrincante
	# respondiendo siguiendo una serie de pasos particulares.
	def initialize()
		@r = 0
		@p = 0
		@t = 0
		@l = 0
		@s = 0
		@generador = Random.new(@@semillaPadre)
    end

    # Retorna una instancia de alguna de las subclases de jugada 
	# representando la próxima jugada. Se suma las cantidades de veces
	# que el contrincante ha jugado cada tipo de jugada y se genera un
	# numero al azar con ese numero como tope. Luego dependiendo del rango
	# en el que cayó el numero al azar se retorna el tipo de jugada correspondiente.
	def prox(j= nil)
		x = j.to_s()
		case x
		when 'Piedra'
			@r = @r + 1
		when 'Papel'
			@p = @p + 1
		when 'Tijera'
			@t = @t + 1
		when 'Lagarto'
			@l = @l + 1
		when 'Spock'
			@s = @s + 1
		else
			'Ocurrio un error con la jugada'
		end
		tope = @r + @p + @t + @l + @s - 1
		if tope <0
			piedra = Piedra.new()
			@r =@r + 1
			return piedra
		else
			numero = self.generador.rand(tope)

			case numero
			when 0..(@r-1)
				aux = Piedra.new()
				return aux
			when @r..(@r+@p-1)
				aux = Papel.new()
				return aux
			when (@r+@p)..(@r+@p+@t-1)
				aux = Tijera.new()
				return aux
			when (@r+@p+@t)..(@r+@p+@t+@l-1)
				aux = Lagarto.new()
				return aux
			when (@r+@p+@t+@l)..(@r+@p+@t+@l+@s-1)
				aux = Spock.new()
				return aux
			else
				"numero invalido"
			end
		end
	end

	# Genera una representación en String de la estrategia Pensar con la frecuencia actual del contricante
	# con respecto a cada jugada.
	def to_s
		x = "Estrategia Pensar, actualmente la frecuencia de juego del contrincante es la siguiente: "
		y = "Piedra = " + @r.to_s + " Papel = " + @p.to_s + " Tijera = " + @t.to_s + " Lagarto = " + @l.to_s + " Spock = " + @s.to_s
		return (x+y)
	end

	# Resetea todos las frecuencias de juego del contrincante.
	def reset
		@r = 0
		@r = 0
		@p = 0
		@t = 0
		@l = 0
		@s = 0
	end
end

##
# Esta clase representa a una Partida que se lleva a cabo entre dos jugadores.
class Partida

	# Numero entero que representa el número de rondas que se ha llevado a cabo en la partida.
	attr_accessor :rondas

	# String que representa el nombre del jugador 1.
	attr_accessor :nombreJugador1

	# String que representa el nombre del jugador 2.
	attr_accessor :nombreJugador2

	# Numero entero que representa la cantidad de puntos acumulados del jugador 1.
	attr_accessor :ptosJugador1

	# Numero entero que representa la cantidad de puntos acumulados del jugador 2.
	attr_accessor :ptosJugador2

	# Representa la estrategia de juego usada por el jugador 1.
	attr_accessor :estrategiaJugador1

	# Representa la estrategia de juego usada por el jugador 2.
	attr_accessor :estrategiaJugador2

	# Representa la jugada realizada por el jugador 1 en la ronda anterior.
	# La primera ronda es nil.
	attr_accessor :ultimaJugadaJugador1

	# Representa la jugada realizada por el jugador 2 en la ronda anterior.
	# La primera ronda es nil.
	attr_accessor :ultimaJugadaJugador2

	##
	# Crea una nueva instancia de Partida.
	# Se recibe un mapa con los nombres y estrategias de los 
	# jugadores. Se genera una excepción si se pasan mas de dos
	# jugadores o no se reciben estrategias válidas.
	def initialize(mapa)
		raise ArgumentError.new("Deben haber exactamente dos jugadores") if mapa.length !=2
		estrategias = mapa.values
		raise ArgumentError.new("Deben haber estrategias validas") unless estrategias[0].is_a?(Estrategia) and estrategias[1].is_a?(Estrategia)
		@rondas = 0
		nombres = mapa.keys
		@nombreJugador1 = nombres[0]
		@nombreJugador2 = nombres[1]
		@ptosJugador1 = 0
		@ptosJugador2 = 0
		@estrategiaJugador1 = estrategias[0]
		@estrategiaJugador2 = estrategias[1]
		@ultimaJugadaJugador1 = nil
		@penultimaJugadaJugador2 = nil
	end

	# Recibe un numero entero positivo y hace que el juego
	# desarrolle n rondas, luego imprime los resultados
	# de cada jugador.
	def rondas(n)
		done = (@ptosJugador1 >= n or @ptosJugador2>=n)
		e1 = @estrategiaJugador1
		e2 = @estrategiaJugador2
		u1 = @ultimaJugadaJugador1
		u2 = @ultimaJugadaJugador2
		p1 = @ptosJugador1
		p2 = @ptosJugador2
		rondas = @rondas
		Shoes.app do
			@img1 = image "Piedra.png"
			@img2 = image "Piedra.png"
			@img1.hide
			@img2.hide
			@puntaje = para [0,0].to_s
			@puntaje.hide

			manual1 = (e1.kind_of? Manual) || (e1.kind_of? Copiar)
			manual2 = (e2.kind_of? Manual) || (e2.kind_of? Copiar)

			if manual1
				@J1 = para "Jugador1: "
				j1 = list_box items: ["Piedra", "Papel", "Tijera", "Lagarto", "Spock"], width: 500
				j1.choose("Piedra")
			end

			if manual2
				@J2 = para "Jugador2: "
				j2 = list_box items: ["Piedra", "Papel", "Tijera", "Lagarto", "Spock"], width: 500
				j2.choose("Piedra")
			end

			button("Siguiente") do
				close if n==0

				unless manual1
					jugada1 = e1.prox(u2)
				else
					jugada1 = str2jugada(j1.text)
				end

				unless manual2
					jugada2 = e2.prox(u1)
				else
					jugada2 = str2jugada(j2.text)
				end

				if e1.kind_of? Copiar
					manual1 = false
					@J1.remove
					j1.remove
				end

				if e2.kind_of? Copiar
					manual2 = false
					@J2.remove
					j2.remove
				end

				@img1.remove
				@img2.remove
				@img1 = image jugada1.to_s+".png"
				@img2 = image jugada2.to_s+".png"
				u1 = jugada1
				u2 = jugada2
				p = jugada1.puntos(jugada2)
				p1 = p1 + p[0]
				p2 = p2 + p[1]
				@puntaje.remove
				@puntaje = para [p1,p2].to_s
				rondas = rondas + 1

				n = n-1

				if n == 0
					@J1.remove
					j1.remove
					@J2.remove
					j2.remove
				end

			end
		end
		@estrategiaJugador1 = e1
		@estrategiaJugador2 = e2
		@ultimaJugadaJugador1 = u1
		@ultimaJugadaJugador2 = u2
		@ptosJugador1 = p1
		@ptosJugador2 = p2
		@rondas = rondas

		producirMapa()
	end

	# Recibe un numero entero positivo y hace que el juego
	# desarrolle n rondas hasta que alguno de los dos jugadores
	# alcance la cantidad de puntos n, luego imprime los resultados
	# de cada jugador.
	def alcanzar(n)
		done = (@ptosJugador1 >= n or @ptosJugador2>=n)
		e1 = @estrategiaJugador1
		e2 = @estrategiaJugador2
		u1 = @ultimaJugadaJugador1
		u2 = @ultimaJugadaJugador2
		p1 = @ptosJugador1
		p2 = @ptosJugador2
		rondas = @rondas
		Shoes.app do
			@img1 = image "Piedra.png"
			@img2 = image "Piedra.png"
			@img1.hide
			@img2.hide
			@puntaje = para [0,0].to_s
			@puntaje.hide

			manual1 = (e1.kind_of? Manual) || (e1.kind_of? Copiar)
			manual2 = (e2.kind_of? Manual) || (e2.kind_of? Copiar)

			if manual1
				@J1 = para "Jugador1: "
				j1 = list_box items: ["Piedra", "Papel", "Tijera", "Lagarto", "Spock"], width: 500
				j1.choose("Piedra")
			end

			if manual2
				@J2 = para "Jugador2: "
				j2 = list_box items: ["Piedra", "Papel", "Tijera", "Lagarto", "Spock"], width: 500
				j2.choose("Piedra")
			end

			button("Siguiente") do
				close if done

				unless manual1
					jugada1 = e1.prox(u2)
				else
					jugada1 = str2jugada(j1.text)
				end

				unless manual2
					jugada2 = e2.prox(u1)
				else
					jugada2 = str2jugada(j2.text)
				end

				if e1.kind_of? Copiar
					manual1 = false
					@J1.remove
					j1.remove
				end

				if e2.kind_of? Copiar
					manual2 = false
					@J2.remove
					j2.remove
				end

				@img1.remove
				@img2.remove
				@img1 = image jugada1.to_s+".png"
				@img2 = image jugada2.to_s+".png"
				u1 = jugada1
				u2 = jugada2
				p = jugada1.puntos(jugada2)
				p1 = p1 + p[0]
				p2 = p2 + p[1]
				@puntaje.remove
				@puntaje = para [p1,p2].to_s
				rondas = rondas + 1
				done = (p1 == n or p2==n)
				if done
					@J1.remove
					j1.remove
					@J2.remove
					j2.remove
				end

			end
		end
		@estrategiaJugador1 = e1
		@estrategiaJugador2 = e2
		@ultimaJugadaJugador1 = u1
		@ultimaJugadaJugador2 = u2
		@ptosJugador1 = p1
		@ptosJugador2 = p2
		@rondas = rondas

		producirMapa()
	end

	# Reinicia todos los valores de la partida.
	def reiniciar
		@rondas = 0
		@ptosJugador1 = 0
		@ptosJugador2 = 0
		@ultimaJugadaJugador1 = nil
		@penultimaJugadaJugador2 = nil
	end

	# Indica los puntos obtenidos por cada jugador y
	# la cantidad de rondas jugadas para el momento en 
	# en que se llama.
	def producirMapa
		datos ={}
		datos[@nombreJugador1] = @ptosJugador1
		datos[@nombreJugador2] = @ptosJugador2
		datos[:Rounds] =@rondas
		puts(datos)
	end

end

# Hace la jugada manual, le pide la jugada al usuario y retorna una instancia de la subclase jugada indicada.
def hacerJugada()
	puts("Indique la jugada que desea realizar (Piedra, Papel, Tijera, Lagarto o Spock)")
	respuesta = gets
	case respuesta
	when "Piedra\n"
		aux = Piedra.new()
		return aux
	when "Papel\n"
		aux = Papel.new()
		return aux
	when "Tijera\n"
		aux = Tijera.new()
		return aux
	when "Lagarto\n"
		aux = Lagarto.new()
		return aux
	when "Spock\n"
		aux = Spock.new()
		return aux
	else
		"Error, no se recibio una jugada valida"
	end
end

# Retorna la instancia de la subclase de jugada correspondiente de acuerdo al string recibido.
def str2jugada(s)
	case s
	when "Piedra"
		Piedra.new
	when "Papel"
		Papel.new
	when "Tijera"
		Tijera.new
	when "Lagarto"
		Lagarto.new
	when "Spock"
		Spock.new
	end
end

# Retorna la instancia de la subclase de Estrategia correspondiente de acuerdo al string recibido.
# Adicionalmente recibe un argumento usado en caso de que la estrategia deseada por el usuario sea
# la Uniforme o la sesgada, este argumento indica la características inicialización de estas estrategias.
def str2estrategia(a,b)
	case a
	when "Manual"
		Manual.new
	when "Pensar"
		Pensar.new
	when "Copiar"
		Copiar.new
	when "Uniforme"
		# b = "[ :Piedra, :Papel, :Tijera, :Lagarto, :Spock ]"
		Uniforme.new(eval(b))
	when "Sesgada"
		# hashAux = eval(b)
		# b = "{ :Piedra => 2, :Papel => 5, :Tijera => 4,:Lagarto => 3, :Spock => 1}"
		Sesgada.new(eval(b))
	end
end

# jug1 = Uniforme.new([ :Piedra, :Papel, :Tijera, :Lagarto, :Spock ])
# jug2 = Pensar.new()
# partidaPrueba = Partida.new({ :Deepthought => jug1, :Multivac => jug2 })
# partidaPrueba.rondas(10)
# partidaPrueba.rondas(20)
# partidaPrueba.alcanzar(1000)

# Shoes.app :RPTLS => "RPTLS" do 
# 	jug1 = Uniforme.new([ :Piedra, :Papel, :Tijera, :Lagarto, :Spock ])
# 	jug2 = Pensar.new()
# 	partidaPrueba = Partida.new({ :Deepthought => jug1, :Multivac => jug2 })
#  button "Jugar" do
#   image "https://www.wikihow.com/images_en/thumb/9/98/Play-Rock-Paper-Scissors-Lizard-Spock-Step-3Bullet1.jpg/v4-900px-Play-Rock-Paper-Scissors-Lizard-Spock-Step-3Bullet1.jpg"
#  end
#  button "Reset" do
#   partidaPrueba.reiniciar
#  end
# end

 Shoes.app(title: "RPTLS", width: 200, height: 200) do
 	# Dropdown list de opciones para escoger la estrategia del jugador 1.
 	E1 = list_box items: ["Uniforme", "Sesgada", "Pensar", "Copiar", "Manual"]
 	E1.choose("Manual")
 	e1 = edit_line
 	#Dropdown list de opciones para escoger la estrategia del jugador 2.
 	E2 = list_box items: ["Uniforme", "Sesgada", "Pensar", "Copiar", "Manual"]
 	E2.choose("Manual")
 	e2 = edit_line
 	#Dropdown list de opciones para escoger la manera de desarrollar la partida.
 	D = list_box items: ["Rondas", "Alcanzar"]
 	D.choose("Alcanzar")
 	d = edit_line
 	button("Jugar") do
 		jug1 = str2estrategia(E1.text, e1.text)
 		jug2 = str2estrategia(E2.text, e2.text)
 		# Se instancia una nueva Partida.
		P = Partida.new({ :Deepthought => jug1, :Multivac => jug2 })
		n = d.text.to_i
		n = 3 if n<=0
		if D.text == "Alcanzar"
			P.alcanzar(n)
		else
			P.rondas(n)
		end
 	end
 end