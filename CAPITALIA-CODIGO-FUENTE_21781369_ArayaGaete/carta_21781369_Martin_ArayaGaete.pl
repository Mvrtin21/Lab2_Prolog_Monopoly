:- module(carta_21781369_Martin_ArayaGaete, [carta/5, get_IdCarta/2, get_TipoCarta/2, get_DescripcionCarta/2, get_AccionCarta/2,
                        set_IdCarta/3, set_TipoCarta/3, set_DescripcionCarta/3, set_AccionCarta/3]).

/*
TDA CARTA:
Desc: Representa una carta del juego, encapsulando su identificador, tipo,
descripción y la acción asociada.
Estrategia: Se utiliza una estructura basada en listas para representar la carta,
lo que permite acceder y modificar fácilmente cada uno de sus atributos.

Argumentos:
- Id (int): Identificador único de la carta.
- Tipo (string): Tipo de carta (por ejemplo, "suerte" o "comunidad").
- Descripcion (string): Descripción o mensaje de la carta.
- Accion (predicado): Predicado que define la acción a ejecutar cuando se utiliza la carta.

Salida:
- TdaCarta (list): Representación de la carta como una lista de sus atributos.
*/

carta(Id, Tipo, Descripcion, Accion, TdaCarta) :-
    TdaCarta = [Id, Tipo, Descripcion, Accion].

/*               GETS              */

/* Se accede al primer elemento de la lista de la carta (Id). */
get_IdCarta([Id | _], Id).

/* Se accede al segundo elemento de la lista de la carta (Tipo). */
get_TipoCarta([_, Tipo | _], Tipo).

/* Se accede al tercer elemento de la lista de la carta (Descripcion). */
get_DescripcionCarta([_, _, Descripcion | _], Descripcion).

/* Se accede al cuarto elemento de la lista de la carta (Accion). */
get_AccionCarta([_, _, _, Accion | _], Accion).

/*               SETS              */

/* Actualiza el primer elemento (Id) de la carta. */
set_IdCarta([_ | Resto], NuevoId, [NuevoId | Resto]).

/* Actualiza el segundo elemento (Tipo) de la carta. */
set_TipoCarta([X, _ | Resto], NuevoTipo, [X, NuevoTipo | Resto]).

/* Actualiza el tercer elemento (Descripcion) de la carta. */
set_DescripcionCarta([X, Y, _ | Resto], NuevaDescripcion, [X, Y, NuevaDescripcion | Resto]).

/* Actualiza el cuarto elemento (Accion) de la carta. */
set_AccionCarta([X, Y, Z, _ | Resto], NuevaAccion, [X, Y, Z, NuevaAccion | Resto]).
