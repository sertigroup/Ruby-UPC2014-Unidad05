#encoding:UTF-8
=begin 
Una persona tiene un dinero que ha heredado. Necesita tomar la decisión de dónde colocarlo para que le rinda 
una rentabilidad adecuada. Para esto, ha investigado que un banco le puede ofrecer por su dinero en modalidad 
a Plazo Fijo, una atractiva oferta.

La oferta consiste en tener tasas de interés escalonadas por el tiempo que su dinero estará sin moverlo a una 
tasa flat (es decir, el interés se calcula por el monto * tasa /100). La tasa inicial ofrecida, se le aumenta 
un punto porcentual por cada tres meses de permanencia y es con capitalización mensual.

Por ejemplo: con un capital de 1000, una tasa de 10% mensual en 3 meses. Capitalización mensual ganará lo siguiente.
1000 * 0.10 = 100
1100 * 0.10 = 110
1210 * 0.11 = 131.10
   		      343.10 es lo que ganará la persona al cabo de 3 meses

Desarrollar un subprograma que determine el interés total que ganará la persona.
=end

def calcularRentabilidad(meses,monto,tasa)
	totale = []
  	total = monto.to_f
  	i = 0
  	for i in 1..meses
   	 	if (meses == 3)
   	 		rentabilidad = total * (tasa / 100.0)
   	 	else
   	 		if (i == 3 || i == 4 || i == 5)
      			rentabilidad = total * ((tasa + 1.0) / 100.0)
    		elsif (i == 6 || i == 7 || i == 8)
   	  			rentabilidad = total * ((tasa + 2.0) / 100.0)
   			elsif (i == 9)
   	  			rentabilidad = total * ((tasa + 3.0) / 100.0)
    		else
      			rentabilidad = total * (tasa / 100.0)
    		end
    	end
    		total = total + rentabilidad
    		totale << rentabilidad  
    	i = i + 1
  	end

  	total_interes = 0.0
  	for j in 0...totale.size
    	total_interes = total_interes + totale[j]
  	end
  	return total_interes.round(2)
end

def calcularInteresTotal(meses,monto,tasa)
  totale = []
  total = monto.to_f
  i = 0
  for i in 1..meses
    if (i == 3 || i == 4 || i == 5)
      rentabilidad = total * ((tasa + 1.0) / 100.0)
    elsif (i == 6 || i == 7 || i == 8)
   	  rentabilidad = total * ((tasa + 2.0) / 100.0)
   	elsif (i == 9)
   	  rentabilidad = total * ((tasa + 3.0) / 100.0)
    else
      rentabilidad = total * (tasa / 100.0)
    end
    total = total + rentabilidad
    totale << rentabilidad  
    i = i + 1
  end

  total_interes = 0.0
  for j in 0...totale.size
    total_interes = total_interes + totale[j]
  end
  return total_interes.round(2)
end

#--- zona de test ----

def test_calcularRentabilidad
	print validate(331.00, calcularRentabilidad(3,1000.00,10.0))
    print validate(85.13, calcularRentabilidad(5,130.00,10.0))
    print validate(182.40, calcularRentabilidad(9,112.10,10.0))    
end

def test_calcularInteresTotal
	print validate(343.10, calcularInteresTotal(3,1000.00,10.0))
    print validate(85.13, calcularInteresTotal(5,130.00,10.0))
    print validate(182.40, calcularInteresTotal(9,112.10,10.0))    
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
   
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_calcularRentabilidad
  test_calcularInteresTotal
  puts " "
end
test


