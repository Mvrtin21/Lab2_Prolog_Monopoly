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
