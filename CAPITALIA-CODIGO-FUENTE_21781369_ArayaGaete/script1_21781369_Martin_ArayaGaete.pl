% 1) Creo 2 jugadores
jugador(21, "Martín",  21, [], 0, false, 21, J1),
jugador(2, "Catalina", 4,  [], 0, false, 0, J2),

% 2) Creo 11 propiedades normales

propiedad(2,  "Cerro San Cristóbal", 25000, 1200, null, 0, false, false, P2),
propiedad(3,  "Plaza Italia",        18000,  900, null, 0, false, false, P3),
propiedad(4,  "Bellavista",          22000, 1100, null, 0, false, false, P4),
propiedad(5,  "Vitacura",            24000, 1300, null, 0, false, false, P5),
propiedad(6,  "Barrio Italia",       16000,  800, null, 0, false, false, P6),
propiedad(7,  "Ñuñoa",               1000, 1000,  null, 0, false, false, P7),
propiedad(8,  "Providencia",         26000, 1400, null, 0, false, false, P8),
propiedad(9,  "Las Condes",          30000, 1500, null, 0, false, false, P9),
propiedad(10, "San Miguel",          1000,   850, null, 0, false, false, P10),


% 3) Casillas especiales
propiedad(1, "salida",      0, 0, null, 0, false, true, P1),
propiedad(11, "veAlaCarcel", 0, 0, null, 0, false, true, P11),
propiedad(12, "suerte",      0, 0, null, 0, false, true, P12),
propiedad(13, "carcel",      0, 0, null, 0, false, true, P13),
propiedad(14, "impuesto",    0, 200, null, 0, false, true, P14),
propiedad(15, "comunidad",   0, 0, null, 0, false, true, P15),

% 4) Cartas de suerte (10)
carta( 1, "suerte", 'Se ganó el Kino! +1000$', ganarDinero(1000),  C1),
carta( 2, "suerte", 'Le debes al SII -1000$',     ganarDinero(-1000), C2),
carta( 3, "suerte", 'Andate a la cárcel!',        irACarcel,          C3),
carta( 4, "suerte", 'Comodin para salir de la carcel!', cartaSalirCarcel, C4),
carta( 5, "suerte", 'Retrocede 3 casillas',       moverJugador(3),   C5),
carta( 6, "suerte", 'Se cambiar la tasa de impuesto', cambiarImpuesto(13),  C6),
carta( 7, "suerte", 'Paga $500',                  ganarDinero(-500), C7),
carta( 8, "suerte", 'Avanza a Providencia',      ganarDinero(-500), C8),
carta( 9, "suerte", 'Cobras intereses +1500$',   ganarDinero(1500),  C9),
carta(10, "suerte", 'Pierdes una vuelta',         ganarDinero(1),       C10),

% 5) Cartas de comunidad (10)
carta(11, "comunidad", 'Pagar colegio $300',       ganarDinero(-300),  D1),
carta(12, "comunidad", 'Multiplica fortuna x2',    duplicarDinero,     D2),
carta(13, "comunidad", 'Recibe $800',              ganarDinero(800),   D3),
carta(14, "comunidad", 'Donación $400',            ganarDinero(-400),  D4),
carta(15, "comunidad", 'Avanza a Bellavista',     moverA(P4),         D5),
carta(16, "comunidad", 'Multa de $700',           ganarDinero(-700),  D6),
carta(17, "comunidad", 'Sube 5 casillas',         moverJugador(5),    D7),
carta(18, "comunidad", 'Recibe $1200',            ganarDinero(1200),  D8),
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

% 9) Simulo tres turnos

juegoJugarTurno(G2, [1,3], Seeds1, jugadorComprarPropiedad, [JugadorSinPropiedad, P7, P7Comprada, JugadorConPropiedad], G3),
juegoJugarTurno(G3, [4,1], Seeds2, ninguna, [], G4),
juegoJugarTurno(G4, [3 ,4], Seeds3, ninguna, [], G5),
juegoJugarTurno(G5, [1 ,2], Seeds4, ninguna, [], G6),
juegoJugarTurno(G6, [3 ,6], Seeds5, ninguna, [], G7),
juegoJugarTurno(G7, [1 ,2], Seeds6, ninguna, [], G8),
juegoJugarTurno(G8, [3 ,6], Seeds7, pagarSalirCarcel, [], G9),

get_JugadoresJuego(G9, [JugadorEnBancarrota,_]),

%Fin de script, Ganadora "Catalina", ya que Martin tiene dinero <= 0.
jugadorEstaEnBancarrota(JugadorEnBancarrota).
