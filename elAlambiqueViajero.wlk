object luke {
    var vehiculo = alambiqueVeloz
    var lugar = paris
    var cantLugaresVisitados = 0
    var recuerdoActual = ""

    method visitar(unLugar) {
    if (unLugar.puedeSerVisitadoPor(vehiculo)) {
        vehiculo.viajar()
        cantLugaresVisitados = cantLugaresVisitados + 1
        recuerdoActual = unLugar.recuerdo()
        lugar = unLugar
        } 
    }
    
    method cambiarVehiculoA(unVehiculo) {
        vehiculo = unVehiculo
    }
    method cantDeLugaresVisitados() {
        return cantLugaresVisitados
    }
    method recuerdo() {
        return recuerdoActual
    }
}

// vehiculos
object alambiqueVeloz {
    var combustible = 100

    method combustible() = combustible
    method esRapido() = true
    method viajar() {
        combustible = 0.max(combustible - 10)
    }
}

// otros vehiculos
object superChatarraEspecial {
    var municiones = 18
    var cañones = 6

    method combustible() {
        return (municiones * 50) + (cañones * 100)
    }

    method viajar() {
        if (municiones >= 3 && cañones >+ 1) {
            municiones = municiones - 3
            cañones = cañones - 1
        } else {
            municiones = 0
            cañones = 0
        }
    }

    method esRapido() {
        return cañones >= 3
    }
}


object antiguallaBlindada {
    var gangsters = 0
    var combustible = 0

    method actualizarGangsters(unaCantidad) {
        gangsters = unaCantidad
        combustible = unaCantidad * 10 
    }

    method esRapido() {
        return gangsters > 5
    }

    method combustible() = combustible

    method gangsters() = gangsters

    method viajar() {
        if (gangsters > 0 && combustible >= 15) {
            gangsters = gangsters - 1
            combustible = combustible - 15
        } else {
           gangsters = 0
           combustible = 0
        }
    }
}



object superConvertible {
    var forma = antiguallaBlindada
    var combustible = 0

    method cambiarFormaA(unaForma) {
        forma = unaForma
    }

    method esRapido() {
        return forma.esRapido()
    }

    method combustible() = combustible

    method viajar() = forma.viajar()
}



// lugares
object paris {
  method recuerdo() {
    return "Llavero de Torre Eiffel"
  }

  method puedeSerVisitadoPor(unVehiculo) {
        return unVehiculo.combustible() > 50 
   }
}

object buenosAires {
    var mateConOSinYerba = "Mate con Yerba"

    method actualizarRecuerdo(unRecuerdo) {
        mateConOSinYerba = unRecuerdo
    }

    method recuerdo() {
        return mateConOSinYerba
  }


   method puedeSerVisitadoPor(unVehiculo) {
        return unVehiculo.esRapido()
   }
}

object bagdad {
    var recuerdoActual = "Bidon Con Petroleo"
    method actualizarRecuerdo(unRecuerdo) {
        recuerdoActual = unRecuerdo
    }
    method recuerdo() {
        return recuerdoActual
  }

   method puedeSerVisitadoPor(unVehiculo) {
        return true
   }
}

object lasVegas {
    var paisHomenajeado = buenosAires

    method paisHomenajeado(unPais) {
        paisHomenajeado = unPais
    }

    method recuerdo() {
        return paisHomenajeado.recuerdo()
    }

    method puedeSerVisitadoPor(unVehiculo) {
        return paisHomenajeado.puedeSerVisitadoPor(unVehiculo)
   }

}

object tokyo {
    var recuerdoActual = "Figura de Anime Edición Limitada"

    method actualizarRecuerdo(unRecuerdo) {
        recuerdoActual = unRecuerdo
    }

    method recuerdo() {
        return recuerdoActual
    }

    method puedeSerVisitadoPor(unVehiculo) {
        return unVehiculo.esRapido() && unVehiculo.combustible() >= 80
    }
}
