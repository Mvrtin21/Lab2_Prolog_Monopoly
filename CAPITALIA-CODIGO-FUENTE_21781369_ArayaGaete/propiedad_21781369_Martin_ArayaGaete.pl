/*
TDA PROPIEDAD:
Desc: Representa a una propiedad en el juego.
Estrategia: Se usa una estructura basada en listas para representar la propiedad.

Argumentos:
%id (int)
%nombre (string)
%precio (int)
%renta (int)
%dueño (id_jugador/null)
%casas (int)
%esHotel (boolean)
%estaHipotecada (boolean)
%propiedad (property)

Salida:
- TdaPropiedad (list): Representación de propiedad como una lista de sus atributos.
   -> Se agrega Contador (int): Un contador inicializado en 0 para futuras funcionalidades.
*/

propiedad(Id, Nombre, Precio, Renta, Dueño, Casas, EsHotel, EsHipotecada, TdaPropiedad) :-
    TdaPropiedad = [Id, Nombre, Precio, Renta, Dueño, Casas, EsHotel, EsHipotecada].

/*               GETS              */

% Se accede al primer elemento de la lista de la propiedad.
get_IdPropiedad([Id | _], Id).

% Se accede al segundo elemento de la lista de la propiedad.
get_NombrePropiedad([_, Nombre | _], Nombre).

% Se accede al tercer elemento de la lista de la propiedad.
get_PrecioPropiedad([_, _, Precio | _], Precio).

% Se accede al cuarto elemento de la lista de la propiedad.
get_RentaPropiedad([_, _, _, Renta | _], Renta).

% Se accede al quinto elemento de la lista de la propiedad.
get_DueñoPropiedad([_, _, _, _, Dueño | _], Dueño).

% Se accede al sexto elemento de la lista de la propiedad.
get_CasasPropiedad([_, _, _, _, _, Casas | _], Casas).

% Se accede al séptimo elemento de la lista de la propiedad.
get_EsHotelPropiedad([_, _, _, _, _, _, EsHotel | _], EsHotel).

% Se accede al octavo elemento de la lista de la propiedad.
get_EsHipotecadaPropiedad([_, _, _, _, _, _, _, EsHipotecada | _], EsHipotecada).

/*               SETS              */

% Se actualiza el primer elemento (Id) de la lista de la propiedad.
set_IdPropiedad([_ | Resto], NuevoId, [NuevoId | Resto]).

% Se actualiza el segundo elemento (Nombre) de la lista de la propiedad.
set_NombrePropiedad([X, _ | Resto], NuevoNombre, [X, NuevoNombre | Resto]).

% Se actualiza el tercer elemento (Precio) de la lista de la propiedad.
set_PrecioPropiedad([X, Y, _ | Resto], NuevoPrecio, [X, Y, NuevoPrecio | Resto]).

% Se actualiza el cuarto elemento (Renta) de la lista de la propiedad.
set_RentaPropiedad([X, Y, Z, _ | Resto], NuevaRenta, [X, Y, Z, NuevaRenta | Resto]).

% Se actualiza el quinto elemento (Dueño) de la lista de la propiedad.
set_DueñoPropiedad([X, Y, Z, A, _ | Resto], NuevoDueño, [X, Y, Z, A, NuevoDueño | Resto]).

% Se actualiza el sexto elemento (Casas) de la lista de la propiedad.
set_CasasPropiedad([X, Y, Z, A, B, _ | Resto], NuevasCasas, [X, Y, Z, A, B, NuevasCasas | Resto]).

% Se actualiza el séptimo elemento (EsHotel) de la lista de la propiedad.
set_EsHotelPropiedad([X, Y, Z, A, B, C, _ | Resto], NuevoEsHotel, [X, Y, Z, A, B, C, NuevoEsHotel | Resto]).

% Se actualiza el octavo elemento (EsHipotecada) de la lista de la propiedad.
set_EsHipotecadaPropiedad([X, Y, Z, A, B, C, D, _ | Resto], NuevoEsHipotecada, [X, Y, Z, A, B, C, D, NuevoEsHipotecada | Resto]).
