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

% RF08: juegoAgregarJugador
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

% RF09: obtener jugador actual
% juegoObtenerJugadorActual(+Juego, -Jugador)
juegoObtenerJugadorActual(Juego, Jugador) :-
    get_JugadoresJuego(Juego, Jugadores),
    get_TurnoActualJuego(Juego, Turno),
    get_elemento(Turno, Jugadores, Jugador).

% get_elemento(+Idx, +Lista, -Elem)  % 1-based
get_elemento(1, [E|_], E).
get_elemento(N, [_|R], E) :-
    N > 1,
    N1 is N - 1,
    get_elemento(N1, R, E).

% RF10: lanzar dados
% myRandom(+Xn, -Xn1)
myRandom(Xn, Xn1) :-
    Xn1 is ((1103515245 * Xn) + 12345) mod 2147483648.

% getDadoRandom(+Seed, -NewSeed, -R)
getDadoRandom(Seed, NewSeed, R) :-
    myRandom(Seed, NewSeed),
    R is 1 + (NewSeed mod 6).

% juegoLanzarDados(+Juego, +Seeds, -NewSeeds, -Resultados)
juegoLanzarDados(Juego, Seeds, NewSeeds, Resultados) :-
    get_NumeroDadosJuego(Juego, N),
    lanzar_n(Seeds, N, NewSeeds, Resultados).

% lanzar_n(+Seeds, +Count, -NewSeedsOut, -RollsOut)
lanzar_n([], 0, [], []).
lanzar_n([S|Ss], C, [NS|NSs], [R|Rs]) :-
    C > 0,
    getDadoRandom(S, NS, R),
    C1 is C - 1,
    lanzar_n(Ss, C1, NSs, Rs).

% RF11: mover jugador
% juegoMoverJugador(+JuegoIn, +IdJugador, +Dados, -JuegoOut)
juegoMoverJugador(JI, Id, Dados, JO) :-
    % suma de dados
    suma_lista(Dados, Sum),
    % extraer jugadores
    get_JugadoresJuego(JI, Jugadores),
    % actualizar posición
    actualizar_posicion(Jugadores, Id, Sum, Jugadores2),
    % set en juego
    set_JugadoresJuego(JI, Jugadores2, JO).

% suma_lista(+L, -S)
suma_lista([], 0).
suma_lista([X|R], S) :-
    suma_lista(R, S2),
    S is X + S2.

% actualizar_posicion(+ListaJug, +Id, +Delta, -NuevaLista)
actualizar_posicion([], _, _, []).
actualizar_posicion([jugador(Id,Nom,Cap,Props,Pos,Car,Cart,Meta)|R], Id, D, [jugador(Id,Nom,Cap,Props,Pos2,Car,Cart,Meta)|R]) :-
    Pos2 is Pos + D.
actualizar_posicion([J|R], Id, D, [J|R2]) :-
    J = jugador(Id2,_,_,_,_,_,_,_),
    Id2 \= Id,
    actualizar_posicion(R, Id, D, R2).
