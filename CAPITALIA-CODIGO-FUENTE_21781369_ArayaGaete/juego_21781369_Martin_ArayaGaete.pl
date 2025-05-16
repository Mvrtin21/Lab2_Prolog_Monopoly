/*
TDA JUEGO:
Desc: Representa una partida del juego.
Estrategia: Se utiliza una estructura basada en listas para representar el juego.

Argumentos:
- Jugadores (lista)
- Tablero (tablero)
- DineroBanco (int)
- NumeroDados (int)
- TurnoActual (int)
- TasaImpuesto (int)
- MaximoCasas (int)
- MaximoHoteles (int)

Salida:
- TdaJuego (list)
*/

juego(Jugadores, Tablero, DineroBanco, NumeroDados, TurnoActual, TasaImpuesto, MaximoCasas, MaximoHoteles, TdaJuego) :-
    TdaJuego = [Jugadores, Tablero, DineroBanco, NumeroDados, TurnoActual, TasaImpuesto, MaximoCasas, MaximoHoteles].

/*               GETTERS              */

/* Se accede al primer elemento de la lista del juego (Jugadores). */
get_JugadoresJuego([Jugadores | _], Jugadores).

/* Se accede al segundo elemento de la lista del juego (Tablero). */
get_TableroJuego([_, Tablero | _], Tablero).

/* Se accede al tercer elemento de la lista del juego (DineroBanco). */
get_DineroBancoJuego([_, _, DineroBanco | _], DineroBanco).

/* Se accede al cuarto elemento de la lista del juego (NumeroDados). */
get_NumeroDadosJuego([_, _, _, NumeroDados | _], NumeroDados).

/* Se accede al quinto elemento de la lista del juego (TurnoActual). */
get_TurnoActualJuego([_, _, _, _, TurnoActual | _], TurnoActual).

/* Se accede al sexto elemento de la lista del juego (TasaImpuesto). */
get_TasaImpuestoJuego([_, _, _, _, _, TasaImpuesto | _], TasaImpuesto).

/* Se accede al séptimo elemento de la lista del juego (MaximoCasas). */
get_MaximoCasasJuego([_, _, _, _, _, _, MaximoCasas | _], MaximoCasas).

/* Se accede al octavo elemento de la lista del juego (MaximoHoteles). */
get_MaximoHotelesJuego([_, _, _, _, _, _, _, MaximoHoteles], MaximoHoteles).

/*               SETTERS              */

/* Actualiza la lista de jugadores del juego. */
set_JugadoresJuego([_ | Resto], NuevoJugadores, [NuevoJugadores | Resto]).

/* Actualiza el tablero del juego. */
set_TableroJuego([X, _ | Resto], NuevoTablero, [X, NuevoTablero | Resto]).

/* Actualiza el dinero del banco. */
set_DineroBancoJuego([X, Y, _ | Resto], NuevoDineroBanco, [X, Y, NuevoDineroBanco | Resto]).

/* Actualiza la cantidad de dados utilizados. */
set_NumeroDadosJuego([X, Y, Z, _ | Resto], NuevoNumeroDados, [X, Y, Z, NuevoNumeroDados | Resto]).

/* Actualiza el turno actual del juego. */
set_TurnoActualJuego([X, Y, Z, A, _ | Resto], NuevoTurnoActual, [X, Y, Z, A, NuevoTurnoActual | Resto]).

/* Actualiza la tasa de impuesto. */
set_TasaImpuestoJuego([X, Y, Z, A, B, _ | Resto], NuevaTasaImpuesto, [X, Y, Z, A, B, NuevaTasaImpuesto | Resto]).

/* Actualiza el máximo de casas. */
set_MaximoCasasJuego([X, Y, Z, A, B, C, _ | Resto], NuevoMaximoCasas, [X, Y, Z, A, B, C, NuevoMaximoCasas | Resto]).

/* Actualiza el máximo de hoteles. */
set_MaximoHotelesJuego([X, Y, Z, A, B, C, D, _], NuevoMaximoHoteles, [X, Y, Z, A, B, C, D, NuevoMaximoHoteles]).



/*               Funciones              */

/*
Desc: Predicado para agregar un jugador a la partida.

Estrategia: Se extrae la lista actual de jugadores, se reconstruye el
tda jugador, se actualiza la lista de
jugadores en el juego y, finalmente, se ajusta el DineroBanco restándole
1500.
Ejemplo de uso:
  juegoAgregarJugador(G1, J1, G1_v2).
*/

juegoAgregarJugador(JuegoIn, JugadorIn, JuegoOut) :-
    CapitalInicial = 1500,
    %se extraen los datos del JugadorIn
    JugadorIn = jugador(Id, Nombre, _, Prop, Pos, Carcel, Cartas, _),
    NuevoTdaJugador = [Id, Nombre, CapitalInicial, Prop, Pos, Carcel, Cartas, 0],
    NuevoJugador = jugador(Id, Nombre, CapitalInicial, Prop, Pos, Carcel, Cartas, NuevoTdaJugador),

    %se actualiza la lista de jugadores en el juego:
    get_JugadoresJuego(JuegoIn, Jugadores),
    append(Jugadores, [NuevoJugador], NuevosJugadores),
    set_JugadoresJuego(JuegoIn, NuevosJugadores, JuegoIntermedio),

    %se actualiza el dinero del banco, descontando el capital inicial asignado
    get_DineroBancoJuego(JuegoIntermedio, Banco),
    NuevoBanco is Banco - CapitalInicial,
    set_DineroBancoJuego(JuegoIntermedio, NuevoBanco, JuegoOut).


indexTurno(0, [Head|_], Head).
indexTurno(Index, [_|Tail], Element) :-
    Index > 0,
    Index1 is Index - 1,
    indexTurno(Index1, Tail, Element).

/*
Predicado: juegoObtenerJugadorActual/2
Descripción: Dado un TDA juego, obtiene el jugador actual (el de cuyo turno se trata)
Ejemplo de uso:
  ?- juego([martin, sofia], [casilla1, casilla2], 100, 1, 0, 2, 1, 1, Juego),
     juegoObtenerJugadorActual(Juego, JugadorActual).
*/
juegoObtenerJugadorActual(Juego, JugadorActual) :-
    get_JugadoresJuego(Juego, Jugadores),
    get_TurnoActualJuego(Juego, TurnoActual),
    indexTurno(TurnoActual, Jugadores, JugadorActual).


% verificar despues xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

% ------------------- GETTERS DEL TDA JUEGO -------------------
:- discontiguous get_NumeroDadosJuego/2.
/* Se accede al primer elemento de la lista del juego (Jugadores). */
get_JugadoresJuego([Jugadores|_], Jugadores).

/* Se accede al cuarto elemento de la lista del juego (NumeroDados). */
get_NumeroDadosJuego([_,_,_,NumeroDados|_], NumeroDados).

/* Se accede al quinto elemento de la lista del juego (TurnoActual). */
get_TurnoActualJuego([_,_,_,_,TurnoActual|_], TurnoActual).

% ------------------- PREDICADOS PARA JUGADOR ACTUAL -------------------

/* Implementación básica de nth0/3 con nombre indexTurno/3 (índice basado en 0) */
indexTurno(0, [Head|_], Head).
indexTurno(Index, [_|Tail], Element) :-
    Index > 0,
    Index1 is Index - 1,
    indexTurno(Index1, Tail, Element).

/*
Predicado: juegoObtenerJugadorActual/2
Descripción: Dado un TDA juego, obtiene el jugador actual (el de cuyo turno se trata).
Ejemplo de uso:
  ?- juego([martin, sofia], [casilla1, casilla2], 100, 2, 0, 2, 1, 1, Juego),
     juegoObtenerJugadorActual(Juego, JugadorActual).
*/
juegoObtenerJugadorActual(Juego, JugadorActual) :-
    get_JugadoresJuego(Juego, Jugadores),
    get_TurnoActualJuego(Juego, TurnoActual),
    indexTurno(TurnoActual, Jugadores, JugadorActual).

% ------------------- SIMULACIÓN DE DADOS -------------------

% Predicado: myRandom/2
% Calcula la nueva semilla (Xn1) a partir de la semilla actual (Xn).
myRandom(Xn, Xn1) :-
    Xn1 is ((1103515245 * Xn) + 12345) mod 2147483648.

% Predicado: getDadoRandom/3
% Dada una semilla Seed, genera:
%   - NvaSeed: La nueva semilla obtenida aplicando myRandom/2.
%   - R: Un valor de dado entre 1 y 6 (R = 1 + (NvaSeed mod 6)).
getDadoRandom(Seed, NvaSeed, R) :-
    myRandom(Seed, NvaSeed),
    R is 1 + (NvaSeed mod 6).

% Predicado: lanzar_dados/3
% Recibe una lista de semillas y devuelve:
%   - Una lista de nuevas semillas.
%   - Una lista de resultados para cada dado.
lanzar_dados([], [], []).
lanzar_dados([Seed|SeedsTail], [NvaSeed|NuevosSeedsTail], [R|Rs]) :-
    getDadoRandom(Seed, NvaSeed, R),
    lanzar_dados(SeedsTail, NuevosSeedsTail, Rs).

/*
Predicado: juegoLanzarDados/4
Descripción:
  Dado un TDA juego y una lista de semillas (con la cantidad de dados definida en el juego),
  simula el lanzamiento de los dados y retorna:
    - NuevosSeeds: Lista con las semillas actualizadas.
    - ResultadoDados: Lista con el resultado (valor entre 1 y 6) de cada dado.
Ejemplo de uso:
  ?- juego([martin, sofia], [casilla1, casilla2], 100, 2, 0, 2, 1, 1, Juego),
     juegoLanzarDados(Juego, [1,5], NuevosSeeds, ResultadoDados).
  Con NumeroDados = 2 y usando semillas [1,5], se espera que ResultadoDados = [1,3].
*/
juegoLanzarDados(Juego, Seeds, NuevosSeeds, ResultadoDados) :-
    get_NumeroDadosJuego(Juego, NumeroDados),
    length(Seeds, NumeroDados),   % Asegura que la cantidad de semillas coincida con NumeroDados.
    lanzar_dados(Seeds, NuevosSeeds, ResultadoDados).
