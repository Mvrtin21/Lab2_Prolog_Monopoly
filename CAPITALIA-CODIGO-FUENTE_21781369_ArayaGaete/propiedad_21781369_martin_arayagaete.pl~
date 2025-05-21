/*
TDA PROPIEDAD:
Desc: Representa a una propiedad en el juego.
Estrategia: Se usa una estructura basada en listas para representar la propiedad.

Argumentos:
- Id (int): Identificador único de propiedad.
- Nombre (string): Nombre de propiedad.
- Precio (int): Precio de la propiedad.
- Renta (int):  Renta de la propiedad.
- Dueño (id_jugador/null): Propietario de propiedad.
- casas (int): Cantidad de casas.
- esHotel (boolean): Booleano para saber si es hotel o no.
- estaHipotecada (boolean): Booleano para saber si esta hipotecada.

Salida:
- TdaPropiedad (list): Representación de propiedad como una lista de sus atributos.
   -> Se agrega Contador (int): Un contador inicializado en 0 para futuras funcionalidades.
*/


propiedad(Id, Nombre, Renta, Dueño, Casas, EsHotel, EsHipotecada, TdaPropiedad) :-
    TdaPropiedad = [Id, Nombre, Renta, Dueño, Casas, EsHotel, EsHipotecada].

/*               GETS              */

% Se accede al primer elemento de la lista de la propiedad.
get_IdPropiedad([Id | _], Id).

% Se accede al segundo elemento de la lista de la propiedad.
get_NombrePropiedad([_, Nombre | _], Nombre).

% Se accede al tercer elemento de la lista de la propiedad.
get_RentaPropiedad([_, _, Renta | _], Renta).

% Se accede al cuarto elemento de la lista de la propiedad.
get_DueñoPropiedad([_, _, _, Dueño | _], Dueño).

% Se accede al quinto elemento de la lista de la propiedad.
get_CasasPropiedad([_, _, _, _, Casas | _], Casas).

% Se accede al sexto elemento de la lista de la propiedad.
get_EsHotelPropiedad([_, _, _, _, _, EsHotel | _], EsHotel).

% Se accede al séptimo elemento de la lista de la propiedad.
get_EsHipotecadaPropiedad([_, _, _, _, _, _, EsHipotecada | _], EsHipotecada).

/*               SETS              */

% Se actualiza el primer elemento (Id) de la lista de la propiedad.
set_IdPropiedad([_ | Resto], NuevoId, [NuevoId | Resto]).

% Se actualiza el segundo elemento (Nombre) de la lista de la propiedad.
set_NombrePropiedad([X, _ | Resto], NuevoNombre, [X, NuevoNombre | Resto]).

% Se actualiza el tercer elemento (Renta) de la lista de la propiedad.
set_RentaPropiedad([X, Y, _ | Resto], NuevaRenta, [X, Y, NuevaRenta | Resto]).

% Se actualiza el cuarto elemento (Dueño) de la lista de la propiedad.
set_DueñoPropiedad([X, Y, Z, _ | Resto], NuevoDueño, [X, Y, Z, NuevoDueño | Resto]).

% Se actualiza el quinto elemento (Casas) de la lista de la propiedad.
set_CasasPropiedad([X, Y, Z, A, _ | Resto], NuevasCasas, [X, Y, Z, A, NuevasCasas | Resto]).

% Se actualiza el sexto elemento (EsHotel) de la lista de la propiedad.
set_EsHotelPropiedad([X, Y, Z, A, B, _ | Resto], NuevoEsHotel, [X, Y, Z, A, B, NuevoEsHotel | Resto]).

% Se actualiza el séptimo elemento (EsHipotecada) de la lista de la propiedad.
set_EsHipotecadaPropiedad([X, Y, Z, A, B, C, _ | Resto], NuevoEsHipotecada, [X, Y, Z, A, B, C, NuevoEsHipotecada | Resto]).

