//PAcks

class PackInicial {
  const duracion = 0 //dias
  const precioBase = 0
  const beneficiosEspeciales = []
  var coordinador = "gustav"

  method duracion() = duracion
  method precioBase() = precioBase
  method beneficiosEspeciales() = beneficiosEspeciales
  method coordinador() = coordinador

  method precioTotal() {
    const costoDeBeneficiosVigentes = beneficiosEspeciales.filter({unBeneficio => unBeneficio.estaVigente()}).sum({unBeneficio => unBeneficio.costo()})

    return precioBase + costoDeBeneficiosVigentes
  }
}

class PackNacional inherits PackInicial {
  const destinoProvincia = "Buenos Aires"
  const listaActividades = []
  
  method destinoProvincia() = destinoProvincia
  method listaActividades() = listaActividades
}

class PackInternacional inherits PackInicial {
  const destinoPais = "EE.UU"
  const cantidadDeEscalas = 0
  const esDeInteres = false //lugar es de interes?

  method destinoPais() = destinoPais
  method cantidadDeEscalas() = cantidadDeEscalas
  method esDeInteres() = esDeInteres

  override method precioTotal() {
    return super() * 1.2
  }
}

//Coordinador

class Coordinador {
  var cantidadDeViajes = 0 //Viajes realizados
  var estaMotivado = false
  var anios = 0 //anios de experiencia
  var rol = "Guia"
  const roles = ["Guia", "Asistente logistico", "Acompaniante"] //roles existentes

  method cantidadDeViajes() = cantidadDeViajes
  method estaMotivado() = estaMotivado
  method anios() = anios
  method rol() = rol
  method roles() = roles

  method cambiar(unRol) {
    const estaDisponible = roles.contains(unRol)

    if(estaDisponible){
      rol = unRol
    } else{
      self.error("rol no valido")
    }
  }

  method altamenteCalificado() {
    return cantidadDeViajes > 20 and ((rol == "Guia" and estaMotivado) or (rol == "Asistente logistico" and anios >= 3) or (rol == "Acompaniante"))
  }
}

//Beneficios

class Beneficio {
  const tipo = "Acceso a salas VIP"//el tipo de beneficio que hay
  var costo = 0
  const estaVigente = false

  method tipo() = tipo
  method costo() = costo
  method estaVigente() = estaVigente
}