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
