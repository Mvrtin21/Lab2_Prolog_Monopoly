:- module(main_21781369_Martin_ArayaGaete, [carta/5,
                                               get_IdCarta/2,
                                               get_TipoCarta/2,
                                               get_DescripcionCarta/2,
                                               get_AccionCarta/2,
                                               set_IdCarta/3,
                                               set_TipoCarta/3, set_DescripcionCarta/3,
                                               set_AccionCarta/3,

                                               tablero/5,
                                               get_PropiedadesTablero/2,
                                               get_CartasSuerteTablero/2,
                                               get_CartasComunidadTablero/2,
                                               get_CasillasEspecialesTablero/2,
                                               set_PropiedadesTablero/3,
                                               set_CartasSuerteTablero/3,
                                               set_CartasComunidadTablero/3,
                                               set_CasillasEspecialesTablero/3,
                                               concatenar_listas/3,
                                               tableroAgregarPropiedad/3,

                                               jugador/8,
                                               get_IdJugador/2,
                                               get_Nombre/2,
                                               get_Dinero/2,
                                               get_Propiedades/2,
                                               get_PosicionActual/2,
                                               get_EstaEnCarcel/2, get_TotalCartasSalir/2,
                                               get_ContadorCarcel/2, get_RecorrioTablero/2, set_IdJugador/3,
                                               set_Nombre/3, set_Dinero/3, set_Propiedades/3, set_PosicionActual/3,
                                               set_EstaEnCarcel/3, set_TotalCartasSalir/3, set_ContadorCarcel/3,
                                               set_RecorrioTablero/3,

                                               propiedad/9,
                                               get_IdPropiedad/2,
                                               get_NombrePropiedad/2,
                                               get_PrecioPropiedad/2,
                                               get_RentaPropiedad/2, get_DueñoPropiedad/2, get_CasasPropiedad/2,
                                               get_EsHotelPropiedad/2, get_EsHipotecadaPropiedad/2, set_IdPropiedad/3,
                                               set_NombrePropiedad/3, set_PrecioPropiedad/3, set_RentaPropiedad/3,
                                               set_DueñoPropiedad/3, set_CasasPropiedad/3, set_EsHotelPropiedad/3,
                                               set_EsHipotecadaPropiedad/3,

                                               juego/9,
                                               % GETTERS del juego
                                               get_JugadoresJuego/2,
                                               get_TableroJuego/2,
                                               get_DineroBancoJuego/2,
                                               get_NumeroDadosJuego/2,
                                               get_TurnoActualJuego/2,
                                               get_TasaImpuestoJuego/2,
                                               get_MaximoCasasJuego/2,
                                               get_MaximoHotelesJuego/2,
                                               % SETTERS del juego
                                               set_JugadoresJuego/3,
                                               set_TableroJuego/3,
                                               set_DineroBancoJuego/3,
                                               set_NumeroDadosJuego/3,
                                               set_TurnoActualJuego/3,
                                               set_TasaImpuestoJuego/3,
                                               set_MaximoCasasJuego/3,
                                               set_MaximoHotelesJuego/3,
                                               % Funciones de tablero y conversión de estructuras
                                               tableroAgregarPropiedades/3,
                                               pares_a_lista/2,
                                               % Gestión de jugadores y listas
                                               juegoAgregarJugador/3,
                                               append_manual/3,
                                               juegoObtenerJugadorActual/2,
                                               juegoObtenerJugadorPorID/3,
                                               get_elemento/3,
                                               % Predicados para dados y cálculo aleatorio
                                               myRandom/2,
                                               getDadoRandom/3,
                                               juegoLanzarDados/4,
                                               lanzar_n/4,
                                               % Movimiento y posicionamiento de jugadores
                                               juegoMoverJugador/4,
                                               actualizar_posicion_jugador/5,
                                               nueva_posicion/5,               % Con flag de "dio la vuelta"
                                               nueva_posicion/4,               % Versión sin flag
                                               suma_lista/2,
                                               % Compra de propiedad y cálculos de renta
                                               jugadorComprarPropiedad/4,
                                               juegoCalcularRentaPropiedad/3,
                                               juegoCalcularRentaJugador/3,
                                               renta_jugador/6,
                                               propiedad_por_id/3,
                                               % Construcción (casas y hoteles)
                                               juegoConstruirCasa/3,
                                               actualizar_casas/4,
                                               juegoConstruirHotel/3,
                                               actualizar_hotel/4,
                                               % Transacciones entre jugadores
                                               jugadorPagarRenta/5,
                                               propiedadHipotecar/2,
                                               % Utilidades para manejo de listas y posiciones
                                               largo/2,
                                               obtenerEnPosicion/3,
                                               eliminarEnPosicion/3,
                                               get_seed/2,
                                               obtenerCartaYRestante/5,
                                               juegoExtraerCarta/6,
                                               % Estado de bancarrota
                                               jugadorEstaEnBancarrota/1,
                                               % Turnos y procesamiento de jugadas
                                               juegoJugarTurno/6,
                                               buscar_casilla_por_nombre/3,
                                               tablero_posicion_carcel/2,
                                               all_equal/1,
                                               replace_nth0/4,
                                               siguiente_turno/3,
                                               % Actualizaciones internas
                                               actualizar_jugador/3,
                                               actualizar_propiedad/3,
                                               ejecutar_accion_carta/3,
                                               procesar_casilla/6,
                                               propiedad_en_posicion/3,
                                               get_Tipo/2]).

:- use_module(carta_21781369_Martin_ArayaGaete).
:- use_module(jugador_21781369_Martin_ArayaGaete).
:- use_module(propiedad_21781369_Martin_ArayaGaete).
:- use_module(tablero_21781369_Martin_ArayaGaete).
:- use_module(juego_21781369_Martin_ArayaGaete).

