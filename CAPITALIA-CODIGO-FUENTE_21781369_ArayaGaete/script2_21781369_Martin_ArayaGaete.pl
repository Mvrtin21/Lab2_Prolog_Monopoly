jugador( 21, "Martin", 1500, [], 0, false, 0, J1),
jugador( 2,  "Victor", 1500, [], 0, false, 0, J2),

%Casillas En total: 17
propiedad(17, "Aldea",                375,   500,  null, 0, false, false, P2),
propiedad(5,  "Templo del Desierto",  1500,  900,  null, 0, false, false, P3),
propiedad(23, "Bosque de Robles",     1200,  600,  null, 0, false, false, P4),
propiedad(8,  "Mina Abandonada",      1600,  850,  null, 0, false, false, P5),
propiedad(31, "Nether Fortress",      2400,  1300, null, 0, false, false, P6),
propiedad(12, "Playa de Coral",       1800,  950,  null, 0, false, false, P7),
propiedad(19, "Taiga Helada",         2200,  1100, null, 0, false, false, P8),
propiedad(28, "End City",             3000,  1500, null, 0, false, false, P9),
propiedad(14, "Lago de Lava",         2600,  1400, null, 0, false, false, P10),
propiedad(9,  "Amanecer en la Sabana",2000,  1000, null, 0, false, false, P11),
propiedad(3,  "Cueva de Dripstone",   1200,  700,  null, 0, false, false, P12),

%Casillas especiales
propiedad(0,  "salida",       0, 0,   null, 0, false, true, P1),
propiedad(21, "veAlaCarcel",  0, 0,   null, 0, false, true, P13),
propiedad(35, "suerte",       0, 0,   null, 0, false, true, P14),
propiedad(7,  "carcel",       0, 0,   null, 0, false, true, P15),
propiedad(16, "impuesto",     0, 200, null, 0, false, true, P16),
propiedad(25, "comunidad",    0, 0,   null, 0, false, true, P17),

%Cartas Suerte
carta(1,  "suerte", '¡Encontraste una mansión del bosque! +1000$ por saqueo', ganarDinero(1000), C1),
carta(2,  "suerte", '¡Inflación! Hasta la esmeralda subió de precio...', cambiarImpuesto(13),    C2),
carta(3,  "suerte", 'Te metiste con un golem... directo a la cárcel', irACarcel,                 C3),
carta(4,  "suerte", 'Obtuviste un Totem de Inmortalidad: comodín para salir de la cárcel', cartaSalirCarcel, C4),
carta(5,  "suerte", 'Un ghast te explotó el portal: retrocede 3 casillas', moverJugador(3), C5),
carta(6,  "suerte", 'Picoteaste netherite y la vendiste bien: recibes $2000', ganarDinero(2000), C6),
carta(7,  "suerte", 'Pagas reparación de armadura: -$500', ganarDinero(-500),                    C7),
carta(8,  "suerte", 'Usaste un ender pearl mal lanzado: apareces en End City', moverA(P9),       C8),
carta(9,  "suerte", 'Redstone bien invertida: cobras intereses de +1500$', ganarDinero(1500),    C9),
carta(10, "suerte", 'Recibes una llave mágica: comodín para salir de la cárcel', cartaSalirCarcel, C10),

%Cartas Comunidad
carta(11, "comunidad", 'Te atacó un creeper, pierdes $666 en reparaciones', ganarDinero(-666), D1),
carta(12, "comunidad", '¡Vendiste un stack de diamantes! Ganas $1200', ganarDinero(1200),      D2),
carta(13, "comunidad", 'Recibiste bendición del aldeano: fortuna duplicada', duplicarDinero,   D3),
carta(14, "comunidad", 'Pagas impuestos por tierras en el Nether: $400', ganarDinero(-400),    D4),
carta(15, "comunidad", 'Viajas al Bosque de Robles para comerciar', moverA(P4),                D5),
carta(16, "comunidad", 'Ganaste concurso de construcción, premio $700', ganarDinero(700),      D6),
carta(17, "comunidad", 'Montaste en strider: avanza 5 casillas', moverJugador(5), D7),
carta(18, "comunidad", 'Robaste del cofre de un aldeano... y te multaron $1125', ganarDinero(-1125), D8),
carta(19, "comunidad", 'Tropiezas en una cueva: retrocedes 2 casillas', moverJugador(2),       D9),
carta(20, "comunidad", 'Enderman te robó recursos: pierdes $1000', ganarDinero(-1000),         D10),


tablero([], [C1,C2,C3,C4,C5,C6,C7,C8,C9,C10],
            [D1,D2,D3,D4,D5,D6,D7,D8,D9,D10],
            [P1, P13, P14, P15, P16, P17], T0),

% 7) Agregar propiedades 0..14
tableroAgregarPropiedades(T0,
[[P1,0],[P2,1],[P3,15],[P4,3],[P5,4], [P6,8],[P7,9],[P8,7],[P9,2],[P10,10], [P11,12],[P12,13],[P13,5],[P14,16],[P15,11], [P16,14], [P17,6]], T1),

juego( [], T1, 10000, 2, 0, 7, 3, 1, JuegoInicio0),

juegoAgregarJugador(JuegoInicio0, J1, JuegoInicio1),
juegoAgregarJugador(JuegoInicio1, J2, JuegoInicio),





juegoObtenerJugadorActual(JuegoInicio, JugadorActual0), % JugadorActual0 debería ser igual a J1
SDado1 = 3, SDado2 = 5,
juegoLanzarDados(JuegoInicio, [SDado1, SDado2], [Semilla1, Semilla2], DADOSdePrueba),

%deberia dar [5, 6]:
juegoLanzarDados(JuegoInicio, [3, 4], [Semilla3, Semilla4], DadosPrueba),

%deberia dar [4, 1]:
juegoLanzarDados(JuegoInicio, [6, 1], [Semilla5, Semilla6], DadosPruebA),

% prueba de la extraccion cartas

juegoExtraerCarta(JuegoInicio, "comunidad", [SDado1, SDado2], _, GameTemp1, TdaCarta1),
juegoExtraerCarta(GameTemp1, "suerte", [2, 2], _, GameTemp2, TdaCarta2),
juegoExtraerCarta(GameTemp2, "comunidad", [3, 6], _, GameTemp3, TdaCarta3),



get_IdJugador(JugadorActual0, ID_deJugadorActual0),
juegoMoverJugador(JuegoInicio, ID_deJugadorActual0, DADOSdePrueba, Juego1),
juegoMoverJugador(JuegoInicio, ID_deJugadorActual0, DadosPrueba, JuegoMover1),
juegoMoverJugador(JuegoInicio, ID_deJugadorActual0, DadosPruebA, JuegoMover2),


jugadorComprarPropiedad(JugadorActual0, P2, P2_v2, Jugador1_v2),
jugadorComprarPropiedad(J2, P4, P4_v2, Jugador2_v2),

%Jugador no tiene dinero para pagar, por lo que daria false.
%jugadorComprarPropiedad(J2, P7, P7_v2, Jugador2_v3),


%Cree un predicado para poder actualizar a un jugador en una partida:
actualizar_jugador(Juego1, Jugador1_v2, Juego2),
actualizar_jugador(Juego2, Jugador2_v2, Juego3_0),



actualizar_propiedad(Juego3_0, P2_v2, Juego3_1),
actualizar_propiedad(Juego3_1, P4_v2, Juego3),

% debe dar false, supongamos P3 no puede pagarla el jugador 1:
% jugadorComprarPropiedad(JA_v1, P3, JA_v2),
juegoCalcularRentaPropiedad(Juego3, P2_v2, MONTO_RENTA_P2),
juegoCalcularRentaPropiedad(Juego3, P4_v2, MONTO_RENTA_P4),

juegoCalcularRentaJugador(Juego2, JA_v3, MONTO_RENTA_JACTUAL_v3),

juegoConstruirCasa(Juego3, P2_v2, Juego4),


propiedad_en_posicion(1, Juego4, P2_v3),
juegoConstruirCasa(Juego4, P2_v3, Juego5),


propiedad_en_posicion(1, Juego5, P2_v4),
juegoConstruirCasa(Juego5, P2_v4, Juego6),

propiedad_en_posicion(1, Juego6, P2_v5),
juegoConstruirHotel(Juego6, P2_v5, Juego7),

propiedadHipotecar(P2_v5, P2_hipotecada),


juegoJugarTurno(JuegoInicio, [1,2], Seeds1, jugadorComprarPropiedad, [JugadorConGanasDeComprarPropiedad, P2,P2Out, JugadorConPropiedad], G3),

%deberia dar el primer jugador de la lista
juegoObtenerJugadorActual(JuegoInicio, JugadorActualInicio),

juegoJugarTurno(G3, [4,1], Seeds2, ninguna, [], G4),

%deberia dar el segundo jugador de la lista
juegoObtenerJugadorActual(G3, JugadorActualG3),

% deberia dar false, este predicado no se pudo probar, su ejecucion tarda demasiado; pero deberia dar false
%juegoJugarTurno(G4, [2,1], Seeds3, juegoConstruirHotel, [JuegoSinHotel, P2, JuegoSinHotelYaQueNoCumpleRequisitos], G5),
juegoJugarTurno(G4, [2,1], Seeds3, ninguna, [loquepongaaquinoimporta], G5),
juegoJugarTurno(G5, [2,21], Seeds4, ninguna, [], G6),

juegoObtenerJugadorActual(G6, JugadorEnBancarrota),
jugadorEstaEnBancarrota(JugadorEnBancarrota).







