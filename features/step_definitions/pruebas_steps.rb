# encoding: utf-8
# Archivo: pruebas_steps.rb
# Autor: Ángel García Baños <angel.garcia@correounivalle.edu.co>
# Autor: Carlos Andrés Delgado Saavedra <carlos.andres.delgado@correounivalle.edu.co>
# Autor: Víctor Andrés Bucheli Guerrero <victor.bucheli@correounivalle.edu.co>
# Fecha creación: 2015-12-15
# Fecha última modificación: 2016-02-06
# Versión: 0.1
# Licencia: GPL

@constantes = Hash.new
@puntos = Hash.new
@conjuntos = Hash.new


Dado /^que se crea una constante '(.*?)' que vale '(.*?)'$/ do |nombre, valor|
  @constantes[nombre] = valor.to_i 
end


Cuando /^se crea un punto '(.*?)' de '(.*?)' dimensiones cuyas coordenadas son todas '([mayor|menor])'es que '(.*?)'$/ do |punto, numeroDimensiones, mayor_menor, limite|
  if mayor_menor == "mayor"
    @puntos[punto] = Punto.new(numeroDimensiones.to_i, @constantes[limite]+0.0001, 1)
  else
    @puntos[punto] = Punto.new(numeroDimensiones.to_i, 0, @constantes[limite])
  end
end


Y /^'(.*?)' '((no )?)' domina a '(.*?)'$/ do |punto1, si_no, punto2|
  if si_no == "no "
    expect(@puntos[punto1].dominado_por?(@puntos[punto2])).to be false
  else
    expect(@puntos[punto1].dominado_por?(@puntos[punto2])).to be true
  end
end


Y /^se cambia la coordenada '(.*?)' de '(.*?)' para que quede '([mayor|menor])' que '(.*?)'$/ do |coordenada, punto, mayor_menor, limite|
  @puntos[punto].cambiarIndicador(coordenada.to_i, (@constante[limite]+(mayor_menor=="mayor" ? 1 : 0))/2)
end


Y /^se copia '(.*?)' en '(.*?)'$/ do |punto1, punto2|
  @puntos[punto2] = @puntos[punto1]
end


Cuando /^se crea un conjunto de puntos vacío '(.*?)'$/ do |conjunto|
  @conjuntos[conjunto] = []
end


Y /^se añaden '(\d?)' puntos de '(.*?)' dimensiones al conjunto '(.*?)', cuyas coordenadas son todas '([mayor|menor])' que '(.*?)'$/ do |cantidad, numeroDimensiones, conjunto, mayor_menor, limite|
  cantidad.times do
    if mayor_menor == "mayor"
      @conjuntos[conjunto] << Punto.new(numeroDimensiones.to_i, @constante[limite]+0.0001, 1)
    else
      @conjuntos[conjunto] << Punto.new(numeroDimensiones.to_i, 0, @constante[limite])
    end
  end
end


Y /^se añade el punto '(.*?)' al conjunto '(.*?)'$/ do |conjunto, punto|
  @conjuntos[conjunto] << @puntos[punto]
end


Entonces /^el óptimo de pareto de '(.*?)' es '(.*?)'$/ do |conjunto1, conjunto2|
pending
end


Cuando /^tengo un ranking '(.*?)'$/ do |ranking|
  @ranking = ranking
end


Y /^una frontera de Pareto '(.*?)'$/ do |fronteraPareto|
  @fronteraPareto = fronteraPareto
end


Entonces /^los puntos '(.*?)' del ranking son falsos positivos y los puntos '(.*?)' son falsos negativos$/ do |falsosPositivos, falsosNegativos|
pending
end







