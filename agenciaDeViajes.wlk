//PAcks

class PackInicial {
  var duracion = 0 //dias
  var precioBase = 0
  const beneficiosEspeciales = []
  var coordinador

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
  var destinoProvincia
  const listaActividades = []
  
  method destinoProvincia() = destinoProvincia
  method listaActividades() = listaActividades
}

class PackInternacional inherits PackInicial {
  var destinoPais
  var cantidadDeEscalas = 0
  var esDeInteres = false //lugar es de interes?

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
  var rol
  const roles = ["Guia", "Asistente logistico", "Acompañente"] //roles existentes

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
}

//Beneficios

class Beneficio {
  const tipo //el tipo de beneficio que hay
  var costo = 0
  const estaVigente = false

  method tipo() = tipo
  method costo() = costo
  method estaVigente() = estaVigente
}