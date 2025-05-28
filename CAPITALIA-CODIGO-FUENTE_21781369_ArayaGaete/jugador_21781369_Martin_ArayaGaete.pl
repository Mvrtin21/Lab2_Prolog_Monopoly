/*
TDA JUGADOR:
Desc: Representa a un jugador en el juego.
Estrategia: Se usa una estructura basada en listas para representar al jugador.

Argumentos:
- Id (int): Identificador único del jugador.
- Nombre (string): Nombre del jugador.
- Dinero (int): Cantidad de dinero disponible.
- Propiedades (list): Lista de identificadores de propiedades que posee.
- PosicionActual (int): Posición actual en el tablero.
- EstaEnCarcel (boolean): Indica si el jugador está en la cárcel (true/false).
- TotalCartasSalir (int): Número de cartas "Salir de la Cárcel Gratis" que posee.

Salida:
- TdaJugador (list): Representación del jugador como una lista de sus atributos.
   -> Se agrega Contador (int): Un contador inicializado en 0 para futuras funcionalidades.
*/


jugador(Id, Nombre, Dinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalir, TdaJugador) :-
    TdaJugador = [Id, Nombre, Dinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalir, 0, false].

% Se accede al sexto elemento de la lista del jugador.
get_IdJugador([ Id |_], Id).

% Se accede al segundo elemento de la lista del jugador.
get_Nombre([_, Nombre |_], Nombre).

% Se accede al tercer elemento de la lista del jugador.
get_Dinero([_, _, Dinero|_], Dinero).

% Se accede al cuarto elemento de la lista del jugador.
get_Propiedades([_, _, _, Propiedades|_], Propiedades).

% Se accede al quinto elemento de la lista del jugador.
get_PosicionActual([_, _, _, _, PosicionActual|_], PosicionActual).

% Se accede al sexto elemento de la lista del jugador.
get_EstaEnCarcel([_, _, _, _, _, Estado | _], Estado).

% Se accede al septimo elemento de la lista del jugador.
get_TotalCartasSalir([_, _, _, _, _, _, TotalCartasSalir|_], TotalCartasSalir).

% Se accede al octavo elemento de la lista del jugador.
get_ContadorCarcel([_, _, _, _, _, _, _, Contador|_], Contador).

% Se accede al noveno elemento de la lista del jugador.
get_RecorrioTablero([_, _, _,_ , _, _, _, _, Recorrio], Recorrio).


/*               SETTERS              */

% actualiza Id
set_IdJugador([_|R], XN, [XN|R]).

% actualiza Nombre
set_Nombre([X, _|R], YN, [X, YN|R]).

% actualiza Dinero
set_Dinero([X, Y, _|R], ZN, [X, Y, ZN|R]).

% actualiza Propiedades
set_Propiedades([X, Y, Z, _|R], AN, [X, Y, Z, AN|R]).

% actualiza PosicionActual
set_PosicionActual([X, Y, Z, A, _|R], BN, [X, Y, Z, A, BN|R]).

% actualiza EstaEnCarcel
set_EstaEnCarcel([X, Y, Z, A, B, _|R], CN, [X, Y, Z, A, B, CN|R]).

% actualiza TotalCartasSalir
set_TotalCartasSalir([X, Y, Z, A, B, C, _|R], DN, [X, Y, Z, A, B, C, DN|R]).

% actualiza ContadorCarcel
set_ContadorCarcel([X, Y, Z, A, B, C, D, _|R], EN, [X, Y, Z, A, B, C, D, EN|R]).

% actualiza si recorrio tablero
set_RecorrioTablero([X, Y, Z, A, B, C, D, E, _|R], EN, [X, Y, Z, A, B, C, D, E, EN|R]).
