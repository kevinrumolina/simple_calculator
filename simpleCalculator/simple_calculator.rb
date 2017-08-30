def menu
    puts '#' * 60
    puts '#' * 60
    puts "YONGA SIMPLE CALCULATOR".rjust(40, "#") + '#' * 20
    puts "WELCOME".rjust(32, "#") + '#' * 28
    puts "_" * 60
    puts ""
    puts "MENU"
    puts "1  Suma de dos numeros"
    puts "2  Suma de un arreglo de numeros"
    puts "3  Resta de dos numeros"
    puts "4  Resta de un arreglo de dos numeros"
    puts "5  Multiplicacion de dos numeros"
    puts "6  Multiplicacion de un arreglo de numeros"
    puts "7  Division de dos numeros"
    puts "8  Division de un arreglo de numeros"
    puts "9  Potencia de dos numeros"
    puts "10 Potencia de un arreglo de numeros"
    puts "0  Salir"
    @input = gets.chomp.to_i
    system "clear"
end

def returning
  puts "Presione cualquier tecla para continuar"
  gets.chomp
  system "clear"
end

def operation_1
  puts "Digite el primer operador"
  op1 = gets.chomp
  puts "Digite el segundo operador"
  op2 = gets.chomp
  if op1.scan(/^(\+|\-)?[0-9]+$/).empty? or op2.scan(/^(\+|\-)?[0-9]+$/).empty?
    puts "Alguno de los valores no es un numero"
    puts "Presione cualquier tecla para continuar"
    returning
  end
  op1 = op1.to_f and op2 = op2.to_f
  puts "El resultado de la operacion #{op1} + #{op2} es: #{suma(op1, op2)}"
  returning
end

def operation_2
  number_array = []
  resultado = 0
  puts "Indique de cuantos numeros desea hacer el arreglo"
  array_length = gets.chomp
  if array_length.scan(/^(\+|\-)?[0-9]+$/).empty?
    puts "Alguno de los valores no es un numero"
    returning
  end
  array_length = array_length.to_i
  i = 0
  system "clear"
  while i < array_length
    puts "Digite el numero que desea agregar al arreglo"
    number = gets.chomp
    if number.scan(/^(\+|\-)?[0-9]+$/).empty?
      puts "Alguno de los valores no es un numero"
      returning
    end
    number_array = number_array.push(number.to_f)
    system "clear"
    puts "El arreglo actual es #{number_array}"
    resultado = resultado + number_array[i]
    i += 1
  end
puts "El resultado de la suma de los numeros del arreglo es: #{resultado}"
returning
end

def operation_3
  puts "Digite el primer operador"
  op1 = gets.chomp
  puts "Digite el segundo operador"
  op2 = gets.chomp
  if op1.scan(/^(\+|\-)?[0-9]+$/).empty? or op2.scan(/^(\+|\-)?[0-9]+$/).empty?
    puts "Digite unicamente fucking numeros malparido"
    puts "Presione cualquier tecla para continuar"
    returning
  end
  op1 = op1.to_f and op2 = op2.to_f
  puts "El resultado de la operacion #{op1} - #{op2} es: #{resta(op1, op2)}"
  returning
end

def operation_4
  number_array = []
  resultado = 0
  puts "Indique de cuantos numeros desea hacer el arreglo"
  array_length = gets.chomp
  if array_length.scan(/^(\+|\-)?[0-9]+$/).empty?
    puts "Alguno de los valores no es un numero"
    returning
  end
  array_length = array_length.to_i
  i = 0
  system "clear"
  while i < array_length
    puts "Digite el numero que desea agregar al arreglo"
    number = gets.chomp
    if number.scan(/^(\+|\-)?[0-9]+$/).empty?
      puts "Alguno de los valores no es un numero"
      returning
    end
    number_array = number_array.push(number.to_f)
    system "clear"
    puts "El arreglo actual es #{number_array}"
    resultado = resultado - number_array[i]
    i += 1
  end
puts "El resultado de la resta de los numeros del arreglo es: #{resultado}"
returning
end

def operation_5
  puts "Digite el primer operador"
  op1 = gets.chomp
  puts "Digite el segundo operador"
  op2 = gets.chomp
  if op1.scan(/^(\+|\-)?[0-9]+$/).empty? or op2.scan(/^(\+|\-)?[0-9]+$/).empty?
    puts "Digite unicamente fucking numeros malparido"
    puts "Presione cualquier tecla para continuar"
    returning
  end
  op1 = op1.to_f and op2 = op2.to_f
  puts "El resultado de la operacion #{op1} * #{op2} es: #{multiplicacion(op1, op2)}"
  returning
end

def operation_6
  number_array = []
  resultado = 1
  puts "Indique de cuantos numeros desea hacer el arreglo"
  array_length = gets.chomp
  if array_length.scan(/^(\+|\-)?[0-9]+$/).empty?
    puts "Alguno de los valores no es un numero"
    returning
  end
  array_length = array_length.to_i
  i = 0
  system "clear"
  while i < array_length
    puts "Digite el numero que desea agregar al arreglo"
    number = gets.chomp
    if number.scan(/^(\+|\-)?[0-9]+$/).empty?
      puts "Alguno de los valores no es un numero"
      returning
    end
    number_array = number_array.push(number.to_f)
    system "clear"
    puts "El arreglo actual es #{number_array}"
    if i == 0 then
      resultado = number_array[i] * resultado
    else
      resultado = resultado * number_array[i]
    end
  i += 1
  end
puts "El resultado de la multiplicacion de los numeros del arreglo es: #{resultado}"
returning
end

def operation_7
  puts "Digite el primer operador"
  op1 = gets.chomp
  puts "Digite el segundo operador"
  op2 = gets.chomp
  if op1.scan(/^(\+|\-)?[0-9]+$/).empty? or op2.scan(/^(\+|\-)?[0-9]+$/).empty?
    puts "Digite unicamente fucking numeros malparido"
    puts "Presione cualquier tecla para continuar"
    returning
  end
  op1 = op1.to_f and op2 = op2.to_f
  puts "El resultado de la operacion #{op1} / #{op2} es: #{division(op1, op2)}"
  returning
end

def operation_8
  number_array = []
  resultado = 1
  puts "Indique de cuantos numeros desea hacer el arreglo"
  array_length = gets.chomp
  if array_length.scan(/^(\+|\-)?[0-9]+$/).empty?
    puts "Alguno de los valores no es un numero"
    returning
  end
  array_length = array_length.to_i
  i = 0
  system "clear"
  while i < array_length
    puts "Digite el numero que desea agregar al arreglo"
    number = gets.chomp
    if number.scan(/^(\+|\-)?[0-9]+$/).empty?
      puts "Alguno de los valores no es un numero"
      returning
    end
    number_array = number_array.push(number.to_f)
    system "clear"
    puts "El arreglo actual es #{number_array}"
    if i == 0 then
      resultado = number_array[i] / resultado
    else
      resultado = resultado / number_array[i]
    end
  i += 1
  end
puts "El resultado de la division de los numeros del arreglo es: #{resultado}"
returning
end

def operation_9
  puts "Digite el primer operador"
  op1 = gets.chomp
  puts "Digite el segundo operador"
  op2 = gets.chomp
  if op1.scan(/^(\+|\-)?[0-9]+$/).empty? or op2.scan(/^(\+|\-)?[0-9]+$/).empty?
    puts "Digite unicamente fucking numeros malparido"
    puts "Presione cualquier tecla para continuar"
    returning
  end
  op1 = op1.to_f and op2 = op2.to_f
  puts "El resultado de la operacion #{op1} ^ #{op2} es: #{exp(op1, op2)}"
  returning
end

def operation_10
  number_array = []
  resultado = 1
  puts "Indique de cuantos numeros desea hacer el arreglo"
  array_length = gets.chomp
  if array_length.scan(/^(\+|\-)?[0-9]+$/).empty?
    puts "Alguno de los valores no es un numero"
    returning
  end
  array_length = array_length.to_i
  i = 0
  system "clear"
  while i < array_length
    puts "Digite el numero que desea agregar al arreglo"
    number = gets.chomp
    if number.scan(/^(\+|\-)?[0-9]+$/).empty?
      puts "Alguno de los valores no es un numero"
      returning
    end
    number_array = number_array.push(number.to_f)
    system "clear"
    puts "El arreglo actual es #{number_array}"
    if i == 0 then
      resultado = number_array[i] ** resultado
    else
      resultado = resultado ** number_array[i]
    end
  i += 1
  end
puts "El resultado de la exponenciacion de los numeros del arreglo es: #{resultado}"
returning
end

def suma(number_a, number_b)
  number_a + number_b
end

def resta(number_a, number_b)
  number_a - number_b
end

def multiplicacion(number_a, number_b)
  number_a * number_b
end

def division(number_a, number_b)
  number_a / number_b
end

def exp(number_a, number_b)
  number_a ** number_b
end

system "clear"
@input = nil

while @input != 0 do
  menu
  case @input
  when 1 then operation_1
  when 2 then operation_2
  when 3 then operation_3
  when 4 then operation_4
  when 5 then operation_5
  when 6 then operation_6
  when 7 then operation_7
  when 8 then operation_8
  when 9 then operation_9
  when 10 then operation_10
  else puts "Opcion invalida"
  end
end
