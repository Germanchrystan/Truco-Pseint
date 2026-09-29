Algoritmo TrucoArgentino
	Definir mazo, manoJugador1, manoJugador2, cartaJugador1, cartaJugador2 Como Entero
	Definir mesaNumero, mesaPalo Como Entero
	Definir opcion, bazaActual, mano, puntajeJugador1, puntajeJugador2 Como Entero
	Definir resultado1, resultado2, resultado3 Como Entero
	Definir cartasActivas, rondaTerminada, opcionValida Como Logico
	Dimension mazo[40, 3]
	Dimension manoJugador1[3], manoJugador2[3], cartasActivas[3]
	Dimension mesaNumero[3, 2], mesaPalo[3, 2]
	
	CrearMazo(mazo)
	puntajeJugador1 <- 0
	puntajeJugador2 <- 0
	mano <- 1
	
	Mientras Verdadero Hacer
		MezclarMazo(mazo, 40)
		RepartirMano(manoJugador1, manoJugador2)
		cartasActivas[0] <- Verdadero
		cartasActivas[1] <- Verdadero
		cartasActivas[2] <- Verdadero
		resultado1 <- 0
		resultado2 <- 0
		resultado3 <- 0
		LimpiarMesa(mesaNumero, mesaPalo)
		rondaTerminada <- Falso
		
		Para bazaActual <- 0 Hasta 2 Hacer
			Si No rondaTerminada Entonces
				RefrescarPantalla
				DibujarMesa(mesaNumero, mesaPalo, puntajeJugador1, puntajeJugador2, resultado1, resultado2, resultado3)
				Escribir "========================================="
				Escribir "BAZA ", bazaActual + 1
				Escribir "========================================="
				DibujarMano(mazo, manoJugador1, cartasActivas)
				SeleccionarCarta(manoJugador1, cartasActivas, cartaJugador1, opcion)
				
				Si opcion = 4 Entonces
					rondaTerminada <- Verdadero
					puntajeJugador2 <- puntajeJugador2 + 1
					Escribir "Jugador 1 se fue al mazo. Punto para jugador 2."
				SiNo
					mesaNumero[bazaActual, 0] <- mazo[manoJugador1[cartaJugador1], 0]
					mesaPalo[bazaActual, 0] <- mazo[manoJugador1[cartaJugador1], 1]
					RefrescarPantalla
					DibujarMesa(mesaNumero, mesaPalo, puntajeJugador1, puntajeJugador2, resultado1, resultado2, resultado3)
					
					cartaJugador2 <- manoJugador2[bazaActual]
					mesaNumero[bazaActual, 1] <- mazo[cartaJugador2, 0]
					mesaPalo[bazaActual, 1] <- mazo[cartaJugador2, 1]
					RefrescarPantalla
					DibujarMesa(mesaNumero, mesaPalo, puntajeJugador1, puntajeJugador2, resultado1, resultado2, resultado3)
					CompararBaza(mazo[manoJugador1[cartaJugador1], 2], mazo[cartaJugador2, 2], bazaActual, resultado1, resultado2, resultado3, rondaTerminada, puntajeJugador1, puntajeJugador2)
					RefrescarPantalla
					DibujarMesa(mesaNumero, mesaPalo, puntajeJugador1, puntajeJugador2, resultado1, resultado2, resultado3)
				FinSi
			FinSi
		FinPara
		
		mano <- 3 - mano
		Escribir "Puntaje: Jugador 1 = ", puntajeJugador1, " | Jugador 2 = ", puntajeJugador2
		Escribir ""
	FinMientras
FinAlgoritmo

SubProceso LimpiarMesa(mesaNumero Por Referencia, mesaPalo Por Referencia)
	Definir baza, jugador Como Entero
	Para baza <- 0 Hasta 2 Hacer
		Para jugador <- 0 Hasta 1 Hacer
			mesaNumero[baza, jugador] <- 0
			mesaPalo[baza, jugador] <- 0
		FinPara
	FinPara
FinSubProceso

SubProceso RefrescarPantalla
	Definir linea Como Entero
	Para linea <- 1 Hasta 30 Hacer
		Escribir ""
	FinPara
FinSubProceso

SubProceso DibujarMesa(mesaNumero, mesaPalo, puntajeJugador1, puntajeJugador2, resultado1, resultado2, resultado3)
	Definir baza, fila, resultado Como Entero
	Escribir "MESA"
	Escribir "Puntos jugador 1: ", puntajeJugador1, "             Puntos jugador 2: ", puntajeJugador2
	Para baza <- 0 Hasta 2 Hacer
		Segun baza Hacer
			0: resultado <- resultado1
			1: resultado <- resultado2
			2: resultado <- resultado3
		FinSegun
		Para fila <- 0 Hasta 6 Hacer
			Si fila = 0 Entonces
				Escribir Sin Saltar "Baza ", baza + 1, ": "
			SiNo
				Escribir Sin Saltar "        "
			FinSi
			Si mesaNumero[baza, 0] = 0 Entonces
				Escribir Sin Saltar "           "
			SiNo
				DibujarFilaCarta(mesaNumero[baza, 0], mesaPalo[baza, 0], fila)
			FinSi
			Si mesaNumero[baza, 0] = 0 O mesaNumero[baza, 1] = 0 Entonces
				Escribir Sin Saltar " - "
			SiNo
				Si fila = 3 Entonces
					Si resultado = 1 Entonces
						Escribir Sin Saltar "J1 "
					SiNo
						Si resultado = 2 Entonces
							Escribir Sin Saltar "J2 "
						SiNo
							Escribir Sin Saltar " = "
						FinSi
					FinSi
				SiNo
					Escribir Sin Saltar " - "
				FinSi
			FinSi
			Si mesaNumero[baza, 1] = 0 Entonces
				Escribir Sin Saltar "           "
			SiNo
				DibujarFilaCarta(mesaNumero[baza, 1], mesaPalo[baza, 1], fila)
			FinSi
			Escribir ""
		FinPara
	FinPara
	Escribir ""
FinSubProceso

SubProceso CrearMazo(mazo Por Referencia)
	mazo[0, 0] <- 1; mazo[0, 1] <- 1; mazo[0, 2] <- 14
	mazo[1, 0] <- 1; mazo[1, 1] <- 2; mazo[1, 2] <- 13
	mazo[2, 0] <- 7; mazo[2, 1] <- 1; mazo[2, 2] <- 12
	mazo[3, 0] <- 7; mazo[3, 1] <- 3; mazo[3, 2] <- 11
	mazo[4, 0] <- 3; mazo[4, 1] <- 1; mazo[4, 2] <- 10
	mazo[5, 0] <- 3; mazo[5, 1] <- 2; mazo[5, 2] <- 10
	mazo[6, 0] <- 3; mazo[6, 1] <- 3; mazo[6, 2] <- 10
	mazo[7, 0] <- 3; mazo[7, 1] <- 4; mazo[7, 2] <- 10
	mazo[8, 0] <- 2; mazo[8, 1] <- 1; mazo[8, 2] <- 9
	mazo[9, 0] <- 2; mazo[9, 1] <- 2; mazo[9, 2] <- 9
	mazo[10, 0] <- 2; mazo[10, 1] <- 3; mazo[10, 2] <- 9
	mazo[11, 0] <- 2; mazo[11, 1] <- 4; mazo[11, 2] <- 9
	mazo[12, 0] <- 1; mazo[12, 1] <- 3; mazo[12, 2] <- 8
	mazo[13, 0] <- 1; mazo[13, 1] <- 4; mazo[13, 2] <- 8
	mazo[14, 0] <- 12; mazo[14, 1] <- 1; mazo[14, 2] <- 7
	mazo[15, 0] <- 12; mazo[15, 1] <- 2; mazo[15, 2] <- 7
	mazo[16, 0] <- 12; mazo[16, 1] <- 3; mazo[16, 2] <- 7
	mazo[17, 0] <- 12; mazo[17, 1] <- 4; mazo[17, 2] <- 7
	mazo[18, 0] <- 11; mazo[18, 1] <- 1; mazo[18, 2] <- 6
	mazo[19, 0] <- 11; mazo[19, 1] <- 2; mazo[19, 2] <- 6
	mazo[20, 0] <- 11; mazo[20, 1] <- 3; mazo[20, 2] <- 6
	mazo[21, 0] <- 11; mazo[21, 1] <- 4; mazo[21, 2] <- 6
	mazo[22, 0] <- 10; mazo[22, 1] <- 1; mazo[22, 2] <- 5
	mazo[23, 0] <- 10; mazo[23, 1] <- 2; mazo[23, 2] <- 5
	mazo[24, 0] <- 10; mazo[24, 1] <- 3; mazo[24, 2] <- 5
	mazo[25, 0] <- 10; mazo[25, 1] <- 4; mazo[25, 2] <- 5
	mazo[26, 0] <- 7; mazo[26, 1] <- 2; mazo[26, 2] <- 4
	mazo[27, 0] <- 7; mazo[27, 1] <- 4; mazo[27, 2] <- 4
	mazo[28, 0] <- 6; mazo[28, 1] <- 1; mazo[28, 2] <- 3
	mazo[29, 0] <- 6; mazo[29, 1] <- 2; mazo[29, 2] <- 3
	mazo[30, 0] <- 6; mazo[30, 1] <- 3; mazo[30, 2] <- 3
	mazo[31, 0] <- 6; mazo[31, 1] <- 4; mazo[31, 2] <- 3
	mazo[32, 0] <- 5; mazo[32, 1] <- 1; mazo[32, 2] <- 2
	mazo[33, 0] <- 5; mazo[33, 1] <- 2; mazo[33, 2] <- 2
	mazo[34, 0] <- 5; mazo[34, 1] <- 3; mazo[34, 2] <- 2
	mazo[35, 0] <- 5; mazo[35, 1] <- 4; mazo[35, 2] <- 2
	mazo[36, 0] <- 4; mazo[36, 1] <- 1; mazo[36, 2] <- 1
	mazo[37, 0] <- 4; mazo[37, 1] <- 2; mazo[37, 2] <- 1
	mazo[38, 0] <- 4; mazo[38, 1] <- 3; mazo[38, 2] <- 1
	mazo[39, 0] <- 4; mazo[39, 1] <- 4; mazo[39, 2] <- 1
FinSubProceso

SubProceso MezclarMazo(mazo Por Referencia, cantCartas)
	Definir i, origen, destino, tempNum, tempPalo, tempValor Como Entero
	Para i <- 0 Hasta cantCartas - 1 Hacer
		origen <- Aleatorio(0, cantCartas - 1)
		destino <- Aleatorio(0, cantCartas - 1)
		tempNum <- mazo[origen, 0]
		tempPalo <- mazo[origen, 1]
		tempValor <- mazo[origen, 2]
		mazo[origen, 0] <- mazo[destino, 0]
		mazo[origen, 1] <- mazo[destino, 1]
		mazo[origen, 2] <- mazo[destino, 2]
		mazo[destino, 0] <- tempNum
		mazo[destino, 1] <- tempPalo
		mazo[destino, 2] <- tempValor
	FinPara
FinSubProceso

SubProceso RepartirMano(manoJugador1 Por Referencia, manoJugador2 Por Referencia)
	Definir i Como Entero
	Para i <- 0 Hasta 2 Hacer
		manoJugador1[i] <- i
		manoJugador2[i] <- i + 3
	FinPara
FinSubProceso

SubProceso SeleccionarCarta(manoJugador1, cartasActivas Por Referencia, cartaElegida Por Referencia, opcion Por Referencia)
	Definir opcionValida Como Logico
	opcionValida <- Falso
	Mientras No opcionValida Hacer
		Escribir "Elija una opcion:"
		Para cartaElegida <- 0 Hasta 2 Hacer
			Si cartasActivas[cartaElegida] Entonces
				Escribir cartaElegida + 1, ". Jugar carta ", cartaElegida + 1
			FinSi
		FinPara
		Escribir "4. Irse al mazo"
		Leer opcion
		Si opcion >= 1 Y opcion <= 3 Y cartasActivas[opcion - 1] Entonces
			cartasActivas[opcion - 1] <- Falso
			cartaElegida <- opcion - 1
			opcionValida <- Verdadero
		SiNo
			Si opcion = 4 Entonces
				opcionValida <- Verdadero
			SiNo
				Escribir "Opcion invalida. Intente nuevamente."
			FinSi
		FinSi
	FinMientras
FinSubProceso

SubProceso CompararBaza(valorJugador1, valorJugador2, bazaActual, resultado1 Por Referencia, resultado2 Por Referencia, resultado3 Por Referencia, rondaTerminada Por Referencia, puntajeJugador1 Por Referencia, puntajeJugador2 Por Referencia)
	Definir ganadasJugador1, ganadasJugador2, pardas Como Entero
	Si valorJugador1 > valorJugador2 Entonces
		Escribir "Jugador 1 gana la baza."
		Segun bazaActual Hacer
			0: resultado1 <- 1
			1: resultado2 <- 1
			2: resultado3 <- 1
		FinSegun
	SiNo
		Si valorJugador2 > valorJugador1 Entonces
			Escribir "Jugador 2 gana la baza."
			Segun bazaActual Hacer
				0: resultado1 <- 2
				1: resultado2 <- 2
				2: resultado3 <- 2
			FinSegun
		SiNo
			Escribir "La baza queda parda."
		FinSi
	FinSi
	
	ganadasJugador1 <- 0
	ganadasJugador2 <- 0
	pardas <- 0
	Si bazaActual >= 0 Entonces
		ContarResultados(resultado1, ganadasJugador1, ganadasJugador2, pardas)
	FinSi
	Si bazaActual >= 1 Entonces
		ContarResultados(resultado2, ganadasJugador1, ganadasJugador2, pardas)
	FinSi
	Si bazaActual >= 2 Entonces
		ContarResultados(resultado3, ganadasJugador1, ganadasJugador2, pardas)
	FinSi
	Si ganadasJugador1 >= 2 O (pardas > 0 Y ganadasJugador1 >= 1) Entonces
		rondaTerminada <- Verdadero
		puntajeJugador1 <- puntajeJugador1 + 1
		Escribir "Jugador 1 gana la ronda."
	SiNo
		Si ganadasJugador2 >= 2 O (pardas > 0 Y ganadasJugador2 >= 1) Entonces
			rondaTerminada <- Verdadero
			puntajeJugador2 <- puntajeJugador2 + 1
			Escribir "Jugador 2 gana la ronda."
		FinSi
	FinSi
FinSubProceso

SubProceso ContarResultados(resultado, ganadasJugador1 Por Referencia, ganadasJugador2 Por Referencia, pardas Por Referencia)
	Si resultado = 1 Entonces
		ganadasJugador1 <- ganadasJugador1 + 1
	SiNo
		Si resultado = 2 Entonces
			ganadasJugador2 <- ganadasJugador2 + 1
		SiNo
			pardas <- pardas + 1
		FinSi
	FinSi
FinSubProceso

Funcion nombre <- NombrePalo(palo)
	Definir nombre Como Caracter
	Segun palo Hacer
		1: nombre <- "espada"
		2: nombre <- "basto"
		3: nombre <- "oro"
		4: nombre <- "copa"
	FinSegun
FinFuncion

SubProceso DibujarCarta(numero, palo)
	Escribir "+---------+"
	Si numero < 10 Entonces
		Escribir "|", numero, "        |"
	SiNo
		Escribir "|", numero, "       |"
	FinSi
	Segun palo Hacer
		1:
			Escribir "|    |    |"
			Escribir "|   -|-   |"
			Escribir "|    |    |"
		2:
			Escribir "|   ( )   |"
			Escribir "|   |#|   |"
			Escribir "|         |"
		3:
			Escribir "|   (0)   |"
			Escribir "|         |"
			Escribir "|         |"
		4:
			Escribir "|  \___/  |"
			Escribir "|   |_|   |"
			Escribir "|         |"
	FinSegun
	Si numero < 10 Entonces
		Escribir "|        ", numero, "|"
	SiNo
		Escribir "|       ", numero, "|"
	FinSi
	Escribir "+---------+"
FinSubProceso

SubProceso DibujarMano(mazo, manoJugador1, cartasActivas)
	Definir fila, carta Como Entero
	Escribir "Mano del jugador 1:"
	Para fila <- 0 Hasta 6 Hacer
		Para carta <- 0 Hasta 2 Hacer
			Si cartasActivas[carta] Entonces
				DibujarFilaCarta(mazo[manoJugador1[carta], 0], mazo[manoJugador1[carta], 1], fila)
			SiNo
				Escribir Sin Saltar "           "
			FinSi
			Escribir Sin Saltar "  "
		FinPara
		Escribir ""
	FinPara
FinSubProceso

SubProceso DibujarFilaCarta(numero, palo, fila)
	Si fila = 0 Entonces
		Escribir Sin Saltar "+---------+"
	SiNo
		Si fila = 1 Entonces
			Si numero < 10 Entonces
				Escribir Sin Saltar "|", numero, "        |"
			SiNo
				Escribir Sin Saltar "|", numero, "       |"
			FinSi
		SiNo
			Si fila = 5 Entonces
				Si numero < 10 Entonces
					Escribir Sin Saltar "|        ", numero, "|"
				SiNo
					Escribir Sin Saltar "|       ", numero, "|"
				FinSi
			SiNo
				Si fila = 6 Entonces
					Escribir Sin Saltar "+---------+"
				SiNo
					Segun palo Hacer
						1:
							Si fila = 2 O fila = 4 Entonces
								Escribir Sin Saltar "|    |    |"
							SiNo
								Escribir Sin Saltar "|   -|-   |"
							FinSi
						2:
							Si fila = 2 Entonces
								Escribir Sin Saltar "|   ( )   |"
							SiNo
								Si fila = 3 Entonces
									Escribir Sin Saltar "|   |#|   |"
								SiNo
									Escribir Sin Saltar "|         |"
								FinSi
							FinSi
						3:
							Si fila = 2 Entonces
								Escribir Sin Saltar "|   (0)   |"
							SiNo
								Escribir Sin Saltar "|         |"
							FinSi
						4:
							Si fila = 2 Entonces
								Escribir Sin Saltar "|  \___/  |"
							SiNo
								Si fila = 3 Entonces
									Escribir Sin Saltar "|   |_|   |"
								SiNo
									Escribir Sin Saltar "|         |"
								FinSi
							FinSi
					FinSegun
				FinSi
			FinSi
		FinSi
	FinSi
FinSubProceso