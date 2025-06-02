:- module(tablero_21781369_Martin_ArayaGaete, [tablero/5, get_PropiedadesTablero/2, get_CartasSuerteTablero/2,
                          get_CartasComunidadTablero/2, get_CasillasEspecialesTablero/2,
                          set_PropiedadesTablero/3, set_CartasSuerteTablero/3,
                          set_CartasComunidadTablero/3, set_CasillasEspecialesTablero/3,
                          concatenar_listas/3, tableroAgregarPropiedad/3]).

/*
TDA TABLERO:
Desc: Representa el tablero del juego, agrupando las distintas estructuras que forman
el mismo:
      - Propiedades: Lista de TDA propiedad.
      - CartasSuerte: Lista de cartas de suerte.
      - CartasComunidad: Lista de cartas de comunidad.
      - CasillasEspeciales: Lista de posiciones (números enteros) que
      indican las casillas especiales (por ejemplo, salida, cárcel, etc.).

Estrategia: Se utiliza una estructura basada en listas para representar el tablero,
lo que permite acceder y modificar fácilmente cada uno de sus componentes.

Argumentos de entrada:
- Propiedades (list): Lista de propiedades (puede estar vacía o contener TDA propiedad).
- CartasSuerte (list): Lista de cartas de tipo suerte.
- CartasComunidad (list): Lista de cartas de tipo comunidad.
- CasillasEspeciales (list): Lista de posiciones especiales en el tablero.

Argumento de salida:
- TdaTablero (list): Representación del tablero como una lista con los 4 componentes anteriores.
*/

tablero(Propiedades, CartasSuerte, CartasComunidad, CasillasEspeciales, TdaTablero) :-
    TdaTablero = [Propiedades, CartasSuerte, CartasComunidad, CasillasEspeciales].

/*               GETTERS              */

/* Se accede al primer elemento de la lista del tablero (Propiedades). */
get_PropiedadesTablero([Propiedades | _], Propiedades).

/* Se accede al segundo elemento de la lista del tablero (CartasSuerte). */
get_CartasSuerteTablero([_, CartasSuerte | _], CartasSuerte).

/* Se accede al tercer elemento de la lista del tablero (CartasComunidad). */
get_CartasComunidadTablero([_, _, CartasComunidad | _], CartasComunidad).

/* Se accede al cuarto elemento de la lista del tablero (CasillasEspeciales). */
get_CasillasEspecialesTablero([_, _, _, CasillasEspeciales], CasillasEspeciales).

/*               SETTERS              */

/* Actualiza la lista de propiedades del tablero. */
set_PropiedadesTablero([_ , CartasSuerte, CartasComunidad, CasillasEspeciales], NuevaPropiedades,
                        [NuevaPropiedades, CartasSuerte, CartasComunidad, CasillasEspeciales]).

/* Actualiza la lista de cartas-suerte del tablero. */
set_CartasSuerteTablero([Propiedades, _ , CartasComunidad, CasillasEspeciales], NuevasCartasSuerte,
                         [Propiedades, NuevasCartasSuerte, CartasComunidad, CasillasEspeciales]).

/* Actualiza la lista de cartas-comunidad del tablero. */
set_CartasComunidadTablero([Propiedades, CartasSuerte, _ , CasillasEspeciales], NuevasCartasComunidad,
                           [Propiedades, CartasSuerte, NuevasCartasComunidad, CasillasEspeciales]).

/* Actualiza la lista de casillas especiales del tablero. */
set_CasillasEspecialesTablero([Propiedades, CartasSuerte, CartasComunidad, _], NuevasCasillasEspeciales,
                              [Propiedades, CartasSuerte, CartasComunidad, NuevasCasillasEspeciales]).


/*               Funciones              */


%---------------------Funcion auxiliar----------------------------
%Meta Primaria: concatenar_listas/3
%Meta Secundaria: concatenar_listas/3

% Base: unir lista vacía con L2 da L2.
concatenar_listas([], L, L).

% Recursión: agrego cabeza de L1 a la solución de append(Resto, L2, R).
concatenar_listas([H|T], L2, [H|R]) :-
    concatenar_listas(T, L2, R).
%-----------------------------------------------------------------


/*
Desc: Predicado para agregar múltiples propiedades al tablero.
      Cada propiedad se agrega como un par [Propiedad, Posicion] a la lista de propiedades.

Estrategia: Resolver de manera declarativa obteniendo la lista actual de propiedades,
           concatenando la lista de nuevas propiedades y actualizando el tablero.

Dom:
- tableroIN (tablero): Instancia inicial del tablero.
- ListaPropiedades (lista): Lista de pares [Propiedad, Posicion] a agregar.

Rec:
- tableroOUT (tablero): Tablero resultante tras agregar las propiedades.

Ejemplo de uso:
  ListaPropiedades = [[P1, 1], [P2, 3], [P3, 6]],
  tableroAgregarPropiedad(T1, ListaPropiedades, T1_actualizado).
*/

tableroAgregarPropiedad(TableroIN, ListaPropiedades, TableroOUT) :-
    get_PropiedadesTablero(TableroIN, PropiedadesActuales),
    concatenar_listas(PropiedadesActuales, ListaPropiedades, PropiedadesNuevas),
    set_PropiedadesTablero(TableroIN, PropiedadesNuevas, TableroOUT).
