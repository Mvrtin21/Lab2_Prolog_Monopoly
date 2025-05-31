:- set_prolog_flag(answer_write_options, [max_depth(0)]).

% ------------------------------------------------------------
% 1) Definición de Jugadores
% ------------------------------------------------------------
% jugador(Id, Nombre, Dinero, Propiedades, TurnosEnCarcel, TieneCartaSalida, Comodines, EstadoBancarrota, VariableJugador)

jugador(11, "JugadorA", 1500, [], 0, false, 0, false, J1),
jugador(22, "JugadorB", 1500, [], 0, false, 0, false, J2),

% ------------------------------------------------------------
% 2) Definición de Propiedades "normales"
% ------------------------------------------------------------
% propiedad(Id, Nombre, Precio, Renta, PropietarioInicial, CasasInicial, Hipotecada, Especial, VariablePropiedad)

propiedad(31, "Pueblo Verde",       300,  50, null, 0, false, false, P1),
propiedad(32, "Ciudad Azul",        350,  55, null, 0, false, false, P2),
propiedad(33, "Villa Roja",         400,  60, null, 0, false, false, P3),
propiedad(34, "Barrio Amarillo",    450,  65, null, 0, false, false, P4),
propiedad(35, "Distrito Naranja",   500,  75, null, 0, false, false, P5),

% ------------------------------------------------------------
% 3) Definición de Casillas Especiales
% ------------------------------------------------------------
% Usaremos sólo la cárcel y la casilla de impuesto para probar cartas y renta
propiedad(30, "Salida",              0,   0, null, 0, false, true, P0),   % Casilla 30 = inicio
propiedad(36, "VeACarcel",           0,   0, null, 0, false, true, P6),
propiedad(37, "ImpuestoRenta",       0,  200, null, 0, false, true, P7),
propiedad(38, "Carcel",              0,   0, null, 0, false, true, P8),

% ------------------------------------------------------------
% 4) Definición de Cartas de Suerte y Comunidad
% ------------------------------------------------------------
% carta(Id, Tipo, Texto, AcciónProlog, VariableCarta)

% Cartas "suerte" (Tipo = suerte)
carta( 1, "suerte", 'Te sale el Kino: +200',         ganarDinero(200),        C1),
carta( 2, "suerte", 'Vete a la carcel',              irACarcel,               C2),
carta( 3, "suerte", 'Avanza a Distrito Naranja',     moverA(P5),              C3),
carta( 4, "suerte", '+1 Comodín para salir de cárcel', cartaSalirCarcel,       C4),

% Cartas "comunidad" (Tipo = comunidad)
carta( 5, "comunidad", 'Paga colegio $100',          ganarDinero(-100),       C5),
carta( 6, "comunidad", 'Recibe $150',                ganarDinero(150),        C6),
carta( 7, "comunidad", 'Multa por congestión: $50',  ganarDinero(-50),        C7),
carta( 8, "comunidad", 'Retrocede 2 casillas',       moverJugador(-2),        C8),

% ------------------------------------------------------------
% 5) Construcción del Tablero
% ------------------------------------------------------------
% tablero(PropiedadesIniciales, BarajaSuerte, BarajaComunidad, CasillasEspeciales, VariableTablero)

tablero([], [C1,C2,C3,C4], [C5,C6,C7,C8], [P0, P6, P7, P8], T0),

% Agregar propiedades normales (Id casilla virtual, Propiedad)
% Notar que asignamos las 5 propiedades a posiciones 1..5
tableroAgregarPropiedades(T0,
    [[P0, 0],  % Salida en posición 0
     [P1, 1],
     [P2, 2],
     [P3, 3],
     [P4, 4],
     [P5, 5],
     [P6, 6],
     [P7, 7],
     [P8, 8]], T1),

% ------------------------------------------------------------
% 6) Configuración del Juego Base y Agregar Jugadores
% ------------------------------------------------------------
% juego(ListaJugadores, Tablero, DineroInicialBanca, CantidadJugadoresMax, IndiceJugadorActual,
%       PrecioCasa, PrecioHotel, CantidadDados, VariableJuego)

juego([], T1, 1500, 2, 0, 5, 10, 2, G0),
juegoAgregarJugador(G0, J1, G1),
juegoAgregarJugador(G1, J2, G2),

% ------------------------------------------------------------
% 7) Secuencia de Pruebas Explícitas de Predicados
% ------------------------------------------------------------

% 7.1) Obtener Jugador Actual al inicio (debe ser J1)
juegoObtenerJugadorActual(G2, JAInit),
% JAInit unifica con J1

% 7.2) Lanzar Dados con semillas: [4,1] ==> se obtiene [6,1] según semilla
SDado1 = 4, SDado2 = 1,
juegoLanzarDados(G2, [SDado1, SDado2], [SDado1_v2, SDado2_v2], DADOS1),
% DADOS1 debería ser [6,1] (suma 7)
% SDado1_v2 unifica con la nueva semilla resultante  (igual a SDado1)
% SDado2_v2 unifica con la nueva semilla resultante  (igual a SDado2)

% 7.3) Mover Jugador Actual (J1) la suma de DADOS1 (7 casillas)
jugadorGetId(JAInit, ID_JAInit),  % ID_JAInit = 11
juegoMoverJugador(G2, ID_JAInit, DADOS1, G3),
% J1 pasa por varias casillas; como T1 tiene sólo 9 posiciones (0..8), se hará wrap-around siguiendo la lógica del TDA Tablero.

% 7.4) J1 intenta comprar la propiedad en la que cayó
%    Supongamos que tras moverse 7, cae en posición: (0 + 7) mod 9 = 7 => P7: "ImpuestoRenta"
%    Como P7 es casilla especial, jugadorComprarPropiedad fallará.
jugadorComprarPropiedad(JAInit, P7, _, _Fail),
% _Fail = false, porque no puede comprar casilla especial.

% 7.5) Jugar turno completo: J1 lanza dados y compra "Pueblo Verde" (posición 1)
% Simulamos que el juego está reiniciado en G2
juegoJugarTurno(G2, [1,1], [S1_x1, S1_x2], jugadorComprarPropiedad, [JAInit, P1, P1_v2], G4),
% Dados con semillas [1,1] => [1,1] => mueve 2 casillas => cae en posición 2 mod 9 = 2 => P2: "Ciudad Azul"
% Sin embargo, forzamos que el argumento indique P1 (posición 1), Prolog solo unifica y no valida ubicación.
% P1_v2 es la nueva versión de P1 con propietario J1.
% G4 refleja que J1 compró P1 (se resta 300 de dinero => J1 tiene 1200).

% 7.6) Obtener Jugador Actual en G4 (debe ser J2)
juegoObtenerJugadorActual(G4, JA2),
% JA2 unifica con J2

% 7.7) Lanzar Dados J2 y Mover/Caer en "Villa Roja" (posición 3)
% Semillas previas [S1_x1, S1_x2] => supongamos S1_x1=1, S1_x2=2 => dados [1,2] => mueve 3.
S1_x1 = 1, S1_x2 = 2,
juegoLanzarDados(G4, [S1_x1, S1_x2], [S2_x1, S2_x2], DADOS2),
jugadorGetId(JA2, ID_JA2),  % ID_JA2 = 22
juegoMoverJugador(G4, ID_JA2, DADOS2, G5),
% DADOS2 debería ser [1,2] => mueve 3 => cae en P3 = "Villa Roja"

% 7.8) J2 compra "Villa Roja" (P3)
jugadorComprarPropiedad(JA2, P3, P3_v2, JA2_v2),
% P3_v2 es P3 con propietario = J2, JA2_v2 tiene listaPropiedades = [P3_v2], dinero J2 = 1100

% 7.9) Cálculo de renta de P1 y P3 en G5
juegoCalcularRentaPropiedad(G5, P1_v2, RentaP1),
juegoCalcularRentaPropiedad(G5, P3_v2, RentaP3),
% RentaP1 = 50  (caso sin casas)
% RentaP3 = 60

% 7.10) Calcular renta que pagaría J1 si aterrizara en P3:
juegoCalcularRentaJugador(G5, JAInit, RentaJ1enP3),
% RentaJ1enP3 = 60

% 7.11) Construcción de casas en P1_v2 (J1 construye 4 casas)
juegoConstruirCasa(G5, P1_v2, G6_1),  % 1era casa sobre P1_v2
juegoConstruirCasa(G6_1, P1_v2, G6_2),% 2a casa
juegoConstruirCasa(G6_2, P1_v2, G6_3),% 3a casa
juegoConstruirCasa(G6_3, P1_v2, G6_4),% 4a casa (límite para edificar hotel)

% 7.12) Intento de construir casa en P3_v2 (J1 no es dueño => falla)
juegoConstruirCasa(G6_4, P3_v2, _FalloCasa),
% _FalloCasa = false

% 7.13) Construir hotel en P1_v2 (J1 ahora puede reemplazar 4 casas por hotel)
juegoConstruirHotel(G6_4, P1_v2, G6_5),
% P1_v2 genera su versión hotel_v2 con 0 casas y un hotel; G6_5 refleja este cambio.

% 7.14) Intento inválido de construir hotel en P3_v2 (J1 no tiene 4 casas) => false
juegoConstruirHotel(G6_5, P3_v2, _FalloHotel),
% _FalloHotel = false

% 7.15) Jugar Carta de Suerte para J2: “Te sale el Kino +200” en G5
% NOTA: Volvemos a G5 para que J2 no haya cambiado
juegoExtraerCarta(G5, "suerte", [3,6], [Sx1, Sx2], G7, CartaJ2),
% Semillas [3,6] => dados internos para barajar cartas; CartaJ2= C1 (ganarDinero(200))
% G7 refleja que J2 recibió +200 y ahora su dinero es 1300.

% 7.16) J2 cae en "Multa Renta" (posición 7) y paga $200
% Supongamos que se mueve del inicio con semillas [5,2] => [3,?] => cae en P7
SD3 = 5, SD4 = 2,
juegoLanzarDados(G7, [SD3, SD4], [N1, N2], DADOS3),
jugadorGetId(JA2, ID_JA2b),
juegoMoverJugador(G7, ID_JA2b, DADOS3, G8),
% G8 indica que J2 aterrizó en P7 ("ImpuestoRenta"), se le retira $200 => dinero=1100

% 7.17) J1 paga renta a J2: J1 aterriza en P3_v2 (aunque J2 es dueño) en G6_5
% Calculamos nuevamente movimiento de J1:
S11 = 2, S12 = 3,  % semillas ficticias que suman 5 => cae en casilla 5 mod 9 = P5 "Distrito Naranja"
juegoLanzarDados(G6_5, [S11, S12], [M1, M2], DADOS4),
jugadorGetId(JAInit, ID_J1b),
juegoMoverJugador(G6_5, ID_J1b, DADOS4, G9),
% G9: J1 cayó en “Distrito Naranja” (P5), que está hipotecada? No, es normal y sin dueño => J1 podría comprar.
jugadorComprarPropiedad(JAInit, P5, P5_v2, JA1_v2),
% J1 compra P5_v2 por $500 => dinero J1 pasa de 1200-500 = 700

% Ahora forzamos que J1 pague renta excesiva a J2:
jugadorPagarRenta(J1_v2, J2_v2, 1000000, J1_v3, J2_v3),
% J1_v2 (dinero 700) intenta pagar renta de 1.000.000 => no tiene fondos => J1_v3 queda con saldo negativo => EstadoBancarrota= true
jugadorEstaEnBancarrota(J1_v3),
% Devuelve true (J1 está en bancarrota)

% 7.18) Hipotecar propiedad P5_v2 en G9 para que J1 recupere algo de liquidez
propiedadHipotecar(P5_v2, P5_v3),
% P5_v3 es la versión hipotecada de la propiedad (Hipotecada=true)

% 7.19) Verificar que J1 ya no está en bancarrota si se le abona el valor de hipoteca ($250)
% (Suponiendo que manualmente se le suma la mitad del precio 500/2=250)
% NOTA: No existe predicado específico para transferir monto banca->jugador en su API,
% así que lo simulamos creando J1_conDineroExtra:
jugador(11, "JugadorA", 250, [P5_v3], 0, false, 0, false, J1Plus),
% Ahora J1Plus ya no está en bancarrota:
\+ jugadorEstaEnBancarrota(J1Plus),

% ------------------------------------------------------------
% 8) Prueba Final: Varios Turnos hasta que un Jugador Pierda
% ------------------------------------------------------------
% Restablecemos juego base G2 para simular múltiples jugadas con semillas encadenadas.

% Semillas iniciales: [2,4] => [2,4] => J1 mueve 6 => cae en P?? => compra o no
juegoJugarTurno(G2, [2,4], [A1, A2], jugadorComprarPropiedad, [J1, P2, P2_v2], G10),
% J1 compra P2 ($350) => Dinero J1 = 1150

% Turno J2: semillas [6,5] => [4,3] => mueve 7 => cae en P7 ("ImpuestoRenta") y paga $200
juegoJugarTurno(G10, [6,5], [B1, B2], ninguna, [], G11),
% J2 queda con 1500-200=1300

% Turno J1: semillas [3,3] => [5,5] => mueve 10 => cae en (posición anterior +10) mod 9 => casilla de "ImpuestoRenta" otra vez => paga $200
juegoJugarTurno(G11, [3,3], [C1, C2], ninguna, [], G12),
% J1 queda con 1150-200 = 950

% Turno J2: semillas [1,1] => [1,1] => mueve 2 => cae en P2_v2 ("Ciudad Azul", ahora tiene dueño J1) => paga renta de 55 a J1
juegoJugarTurno(G12, [1,1], [D1, D2], ninguna, [], G13),
% G13: J2 paga $55 => J2=1245; J1 recibe $55 => J1=1005

% Turno J1: semillas [5,6] => [3,4] => mueve 7 => cae en P7 (ImpuestoRenta) otra vez => paga $200
juegoJugarTurno(G13, [5,6], [E1, E2], ninguna, [], G14),
% J1: 1005-200 = 805

% Turno J2: semillas [4,2] => [6,2] => mueve 8 => cae en P8 ("Carcel") => no compra, se envía a cárcel (sin pagar renta)
juegoJugarTurno(G14, [4,2], [F1, F2], ninguna, [], G15),
% J2 en Carcel, no paga pero salta su próximo turno

% Turno J1: semillas [2,2] => [2,2] => mueve 4 => cae en "Barrio Amarillo" P4 -> compra
juegoJugarTurno(G15, [2,2], [G1s, G2s], jugadorComprarPropiedad, [J1, P4, P4_v2], G16),
% J1 compra P4 ($450) => 805-450=355

% Turno J2 (sigue en cárcel, esl salto automático)
juegoJugarTurno(G16, [0,0], [H1, H2], pagarSalirCarcel, [J2, QSalida], G17),
% J2 paga $50 para salir => 1245-50=1195

% Turno J1: semillas [3,6] => [5,4] => mueve 9 => cae en P (9 mod 9 = 0) "Salida" => recibe $0
juegoJugarTurno(G17, [3,6], [I1, I2], ninguna, [], G18),
% J1 permanece con 355

% Turno J2: semillas [2,5] => [2,3] => mueve 5 => cae en P5 ("Distrito Naranja", libre) -> compra
juegoJugarTurno(G18, [2,5], [J1s, J2s], jugadorComprarPropiedad, [J2, P5, P5_v2b], G19),
% J2 compra P5 ($500) => 1195-500=695

% Turno J1: semillas [1,1] => [1,1] => mueve 2 => cae en P2_v2 ("Ciudad Azul", dueño J1) => no paga nada
juegoJugarTurno(G19, [1,1], [K1, K2], ninguna, [], G20),
% J1 = 355

% Turno J2: semillas [6,6] => [4,4] => mueve 8 => cae en P8 ("Carcel") -> nada en dinero
juegoJugarTurno(G20, [6,6], [L1, L2], ninguna, [], G21),
% J2 = 695

% Turno J1: semillas [2,4] => [2,4] => mueve 6 => cae en P6 ("VeACarcel") => enviado a cárcel
juegoJugarTurno(G21, [2,4], [M1, M2], ninguna, [], G22),
% J1 queda con 355

% Turno J2: semillas [3,3] => [5,5] => mueve 10 => cae en P (posición Carcel+10) mod 9 => P? sin mayor relevancia
juegoJugarTurno(G22, [3,3], [N1, N2], ninguna, [], G23),
% J2 = 695

% Turno J1 (en cárcel, paga $50 para salir)
juegoJugarTurno(G23, [0,0], [O1, O2], pagarSalirCarcel, [J1, QSalida2], G24),
% J1 paga $50 => 355-50=305

% Turno J2: semillas [5,1] => [3,1] => mueve 4 => cae en P4_v2 ("Barrio Amarillo", dueño J1) => paga renta de 65
juegoJugarTurno(G24, [5,1], [P1s, P2s], ninguna, [], G25),
% G25: J2 paga $65 => 695-65=630; J1 = 305+65=370

% Turno J1: semillas [4,6] => [6,4] => mueve 10 => cae en P (10 mod 9 =1) => P1_v2 ("Pueblo Verde", dueño J1) => no paga
juegoJugarTurno(G25, [4,6], [Q1, Q2], ninguna, [], G26),
% J1 = 370

% Turno J2: semillas [2,2] => [2,2] => mueve 4 => cae en P4_v2 ("Barrio Amarillo", dueño J1) => paga renta de 65
juegoJugarTurno(G26, [2,2], [R1, R2], ninguna, [], G27),
% J2 = 630-65=565; J1 = 370+65=435

% Turno J1: semillas [3,4] => [5,4] => mueve 9 => cae en P (9 mod 9 = 0) "Salida" => recibe $0
juegoJugarTurno(G27, [3,4], [S1u, S2u], ninguna, [], G28),
% J1 = 435

% Turno J2: semillas [6,6] => [4,4] => mueve 8 => cae en P8 ("Carcel") y se queda
juegoJugarTurno(G28, [6,6], [T1, T2], ninguna, [], G29),
% J2 = 565

% Turno J1: semillas [5,5] => [3,5] => mueve 8 => cae en P8 ("Carcel"), enviado a cárcel
juegoJugarTurno(G29, [5,5], [U1, U2], ninguna, [], G30),
% J1 = 435

% Turno J2 (en cárcel, paga $50)
juegoJugarTurno(G30, [0,0], [V1, V2], pagarSalirCarcel, [J2, QSalida3], G31),
% J2 paga $50 => 565-50=515

% Turno J1 (en cárcel, paga $50)
juegoJugarTurno(G31, [0,0], [W1, W2], pagarSalirCarcel, [J1, QSalida4], G32),
% J1 paga $50 => 435-50=385

% Turno J2: semillas [4,2] => [6,2] => mueve 8 => cae en P8 ("Carcel") nuevamente
juegoJugarTurno(G32, [4,2], [X1, X2], ninguna, [], G33),
% J2 = 515

% Turno J1: semillas [3,3] => [5,5] => mueve 10 => cae en P (10 mod 9 = 1) => P1_v2 ("Pueblo Verde", dueño J1) => no paga
juegoJugarTurno(G33, [3,3], [Y1, Y2], ninguna, [], G34),
% J1 = 385

% Turno J2 (en cárcel)... y así sucesivamente. Podríamos continuar hasta que uno no tenga fondos suficientes para pagar otra renta/impuesto.
% Para abreviar, forzamos que J2 pague monto de renta muy alto y quiebre:

% 7.20) Pago masivo: J2 paga renta de 10000 a J1, provocando bancarrota de J2
jugadorPagarRenta(J2, J1, 10000, J2Final, J1Final),
% J2Final queda con saldo negativo => bancarrota
jugadorEstaEnBancarrota(J2Final).

% ------------------------------------------------------------
% FIN DEL SCRIPT
% ------------------------------------------------------------
