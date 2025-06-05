% 1) Creo 2 jugadores
jugador(21, "Martín",    21, [], 0, false, 0, J1),
jugador(2, "Catalina", 4, [], 0, false, 0, J2),

% 2) Creo 10 propiedades normales
propiedad(2,  "Cerro San Cristóbal", 1200, 1200, null, 0, false, false, P2),
propiedad(3,  "Plaza Italia",        1800,  900, null, 0, false, false, P3),
propiedad(4,  "Bellavista",          1200, 1100, null, 0, false, false, P4),
propiedad(5,  "Vitacura",            2400, 1300, null, 0, false, false, P5),
propiedad(6,  "Barrio Italia",       1600,  800, null, 0, false, false, P6),
propiedad(7,  "Ñuñoa",               2000, 1000, null, 0, false, false, P7),
propiedad(8,  "Providencia",         2600, 1400, null, 0, false, false, P8),
propiedad(9,  "Las Condes",          3000, 1500, null, 0, false, false, P9),
propiedad(10, "San Miguel",          1000,  850, null, 0, false, false, P10),


% 3) Casillas especiales
propiedad(1, "salida",       0, 0, null, 0, false, true, P1),
propiedad(11, "veAlaCarcel", 0, 0, null, 0, false, true, P11),
propiedad(12, "suerte",      0, 0, null, 0, false, true, P12),
propiedad(13, "carcel",      0, 0, null, 0, false, true, P13),
propiedad(14, "impuesto",    0, 200, null, 0, false, true, P14),
propiedad(15, "comunidad",   0, 0, null, 0, false, true, P15),

% 4) Cartas de suerte (10)
carta( 1, "suerte", 'Se ganó el Kino! +1000$', ganarDinero(1000),  C1),
carta( 2, "suerte", 'Inflacion!',     cambiarImpuesto(13), C2),
carta( 3, "suerte", 'Andate a la cárcel!',        irACarcel,          C3),
carta( 4, "suerte", '+1 Comodin para salir de carcel',         cartaSalirCarcel,    C4),
carta( 5, "suerte", 'Retrocede 3 casillas',       moverJugador(-3),   C5),
carta( 6, "suerte", 'Recibe $2000',               ganarDinero(2000),  C6),
carta( 7, "suerte", 'Paga $500',                  ganarDinero(-500),  C7),
carta( 8, "suerte", 'Avanza a Providencia',      moverA(P8),         C8),
carta( 9, "suerte", 'Cobras intereses +1500$',   ganarDinero(1500),  C9),
carta(10, "suerte", '+1 Comodin para salir de carcel',         cartaSalirCarcel,       C10),

% 5) Cartas de comunidad (10)
carta(11, "comunidad", 'Pagar colegio $300',       ganarDinero(-300),  D1),
carta(12, "comunidad", 'Multiplica fortuna x2',    duplicarDinero,     D2),
carta(13, "comunidad", 'Recibe $800',              ganarDinero(800),   D3),
carta(14, "comunidad", 'Donación $400',            ganarDinero(-400),  D4),
carta(15, "comunidad", 'Avanza a Bellavista',     moverA(P4),         D5),
carta(16, "comunidad", 'Multa de $700',           ganarDinero(700),  D6),
carta(17, "comunidad", 'Sube 5 casillas',         moverJugador(5),    D7),
carta(18, "comunidad", 'Recibe $1200',            ganarDinero(-300),  D8),
carta(19, "comunidad", 'Retrocede 2 casillas',    moverJugador(2),   D9),
carta(20, "comunidad", 'Pierdes $1000',           ganarDinero(-1000), D10),

% 6) Tablero vacío con cartas separadas
tablero([], [C1,C2,C3,C4,C5,C6,C7,C8,C9,C10],
            [D1,D2,D3,D4,D5,D6,D7,D8,D9,D10],
            [P0, P11, P12, P13, P14, P15], T0),

% 7) Agregar propiedades 0..14
tableroAgregarPropiedades(T0,
[[P1,0],[P2,1],[P3,2],[P4,3],[P5,4], [P6,5],[P7,6],[P8,7],[P9,8],[P10,9], [P11,10],[P12,11],[P13,12],[P14,13],[P15,14]], T1),

% 8) Creo juego base y agrego jugadores
juego([],  T1, 20000, 2, 0, 10, 4, 1, G0),
juegoAgregarJugador(G0, J1, G1),
juegoAgregarJugador(G1, J2, G2),



juegoObtenerJugadorActual(G2, JugadorActual0), % JugadorActual0 debería ser igual a J1
SDado1 = 3, SDado2 = 5,
juegoLanzarDados(G2, [SDado1, SDado2], [Semilla1, Semilla2], DADOSdePrueba),

%deberia dar [5, 6]:
juegoLanzarDados(G2, [3, 4], [Semilla3, Semilla4], DadosPrueba),

%deberia dar [4, 1]:
juegoLanzarDados(G2, [6, 1], [Semilla5, Semilla6], DadosPruebA),

% prueba de la extraccion cartas



get_IdJugador(JugadorActual0, ID_deJugadorActual0),
juegoMoverJugador(G2, ID_deJugadorActual0, DadosPruebA, JuegoMover2),

jugadorComprarPropiedad(JugadorActual0, P2, P2_v2, Jugador1_v2),


actualizar_propiedad(JuegoMover2, P2_v2, Juego3_1),
actualizar_propiedad(Juego3_1, P4_v2, Juego3),

% debe dar false, supongamos P3 no puede pagarla el jugador 1:
% jugadorComprarPropiedad(JA_v1, P3, JA_v2),
juegoCalcularRentaPropiedad(Juego3, P2_v2, MONTO_RENTA_P2),
juegoCalcularRentaPropiedad(Juego3, P4_v2, MONTO_RENTA_P4),

juegoCalcularRentaJugador(Juego3, Jugador1_v2, MONTO_RENTA_JACTUAL_v3),

juegoConstruirCasa(Juego3, P2_v2, Juego4),


% 9) Simulo tres turnos
juegoJugarTurno(G2, [4,3], Seeds1, jugadorComprarPropiedad, [JugadorConGanasDeComprarPropiedad, P2,P2Out, JugadorConPropiedad], G3),
juegoJugarTurno(G3, [4,1], Seeds2, ninguna, [], G4),
juegoJugarTurno(G4, [2,1], Seeds3, ninguna, [loquepongaaquinoimporta], G5),
juegoJugarTurno(G5, [2,21], Seeds4, ninguna, [], G6),

juegoObtenerJugadorActual(G6, JugadorEnBancarrota),
jugadorEstaEnBancarrota(JugadorEnBancarrota).
