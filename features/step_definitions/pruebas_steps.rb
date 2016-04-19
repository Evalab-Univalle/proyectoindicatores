# encoding: utf-8
# Archivo: pruebas_steps.rb
# Autor: Ángel García Baños <angel.garcia@correounivalle.edu.co>
# Autor: Carlos Andrés Delgado Saavedra <carlos.andres.delgado@correounivalle.edu.co>
# Autor: Víctor Andrés Bucheli Guerrero <victor.bucheli@correounivalle.edu.co>
# Fecha creación: 2015-12-15
# Fecha última modificación: 2016-04-19
# Versión: 0.1
# Licencia: GPL


CAPTURA_UN_ENTERO = Transform /^\d+$/ do |valor|
  valor.to_i
end


CAPTURA_UN_FLOTANTE = Transform /^\d+\.\d+$/ do |valor|
  valor.to_f
end


Before do
  @constantes = Hash.new
  @puntos = Hash.new
  @conjuntos = Hash.new
end


#----------------------------

Dado /^que se crea una constante real (.*?) que vale (#{CAPTURA_UN_FLOTANTE})$/ do |nombre, valor|
  @constantes[nombre] = valor
end


Dado /^que se crea una constante entera (.*?) que vale (#{CAPTURA_UN_ENTERO})$/ do |nombre, valor|
  @constantes[nombre] = valor
end


Cuando /^se crea un punto (.*?) de (.*?) dimensiones cuyas coordenadas son todas (mayor|menor)es que (.*?)$/ do |punto, numeroDimensiones, mayor_menor, limite|
  if mayor_menor == "mayor"
    @puntos[punto] = Punto.new(@constantes[numeroDimensiones], @constantes[limite]+0.0001, 1.0)
  else
    @puntos[punto] = Punto.new(@constantes[numeroDimensiones], 0.0, @constantes[limite])
  end
end


Y /^(.*?) (no )?domina a (.*?)$/ do |punto1, si_no, punto2|
  if si_no == "no "
    expect(@puntos[punto2].dominado_por?(@puntos[punto1])).to be false
  else
    expect(@puntos[punto2].dominado_por?(@puntos[punto1])).to be true
  end
end


Y /^se cambia la coordenada (#{CAPTURA_UN_ENTERO}) de (.*?) para que quede (mayor|menor) que (.*?)$/ do |coordenada, punto, mayor_menor, limite|
  @puntos[punto].cambiarIndicador(coordenada, (@constantes[limite]+(mayor_menor=="mayor" ? 1 : 0))/2.0)
end


Y /^se copia (.*?) en (.*?)$/ do |punto1, punto2|
  @puntos[punto2] = @puntos[punto1]
end


Cuando /^se crea un conjunto de puntos vacío (.*?)$/ do |conjunto|
  @conjuntos[conjunto] = []
end


Y /^se añaden (#{CAPTURA_UN_ENTERO}) puntos de (.*?) dimensiones al conjunto (.*?), cuyas coordenadas son todas (mayor|menor)es que (.*?)$/ do |cantidad, numeroDimensiones, conjunto, mayor_menor, limite|
  cantidad.times do
    if mayor_menor == "mayor"
      @conjuntos[conjunto] << Punto.new(@constantes[numeroDimensiones], @constantes[limite]+0.0001, 1.0)
    else
      @conjuntos[conjunto] << Punto.new(@constantes[numeroDimensiones], 0.0, @constantes[limite])
    end
  end
end


Y /^se añade el punto (.*?) al conjunto (.*?)$/ do |punto, conjunto|
  @conjuntos[conjunto] << @puntos[punto]
end


Entonces /^el óptimo de pareto de (.*?) es (.*?)$/ do |conjunto1, conjunto2|
pending
end


Cuando /^tengo un ranking (.*?)$/ do |ranking|
  @ranking = ranking
end


Y /^una frontera de Pareto (.*?)$/ do |fronteraPareto|
  @fronteraPareto = fronteraPareto
end


Entonces /^los puntos (.*?) del ranking son falsos positivos y los puntos (.*?) son falsos negativos$/ do |falsosPositivos, falsosNegativos|
pending
end







