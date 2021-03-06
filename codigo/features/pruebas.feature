# language: es
# encoding: utf-8
# Archivo: CapturarErroresEnSSARA.feature
# Autor: Ángel García Baños <angel.garcia@correounivalle.edu.co>
# Autor: Carlos Andrés Delgado Saavedra <carlos.andres.delgado@correounivalle.edu.co>
# Autor: Víctor Andrés Bucheli Guerrero <victor.bucheli@correounivalle.edu.co>
# Fecha creación: 2015-12-15
# Fecha última modificación: 2016-02-06
# Versión: 0.1
# Licencia: GPL

Característica: verificar que se calcula correctamente la dominancia y la frontera de Pareto

  Antecedentes: Se crea una constante y el número de dimensiones
    Dado que se crea una constante K que vale 0.6
    Y que se crea una constante D que vale 30
   
@dominancia
  Escenario: A domina a B; B no domina a A
    Cuando se crea un punto A de D dimensiones cuyas coordenadas son todas mayores que K
    Y se crea un punto B de D dimensiones cuyas coordenadas son todas menores que K
    Entonces A domina a B
    Y B no domina a A

  Escenario: A no domina a B; B no domina a A
    Cuando se crea un punto A de D dimensiones cuyas coordenadas son todas mayores que K
    Y se crea un punto B de D dimensiones cuyas coordenadas son todas menores que K
    Y se cambia la coordenada 1 de A para que quede menor que K
    Entonces A no domina a B
    Y B no domina a A

  Escenario: A domina a B; B domina a A
    Cuando se crea un punto A de D dimensiones cuyas coordenadas son todas mayores que K
    Y se copia A en B
    Entonces A domina a B
    Y B domina a A
    
@frontera    
  Escenario: 
    Cuando se crea un conjunto de puntos vacío P
    Y se añade al conjunto P muchos puntos de D dimensiones cuyas coordenadas son todas menores que K
    Y se crea un punto A de D dimensiones cuyas coordenadas son todas mayores que K
    Y se copia A en B
    Y se copia A en C
    Y se cambia la coordenada 1 de A para que quede menor que K
    Y se cambia la coordenada 2 de B para que quede menor que K
    Y se cambia la coordenada 3 de C para que quede menor que K
    Y se añade al conjunto P el punto A
    Y se añade al conjunto Q el punto A
    Y se añade al conjunto P el punto B
    Y se añade al conjunto Q el punto B
    Y se añade al conjunto P el punto C
    Y se añade al conjunto Q el punto C
    Entonces el óptimo de pareto de P es Q
        
@falsos
  Escenario: Contar falsos positivos y falsos negativos
    Cuando tengo un ranking [1,2,3,4,5,6,7,8,9]
    Y una frontera de Pareto [2,8,6,1]
    Entonces los puntos [3,4,5,7] del ranking son falsos positivos y los puntos [6,8] son falsos negativos
    
    
    
    
