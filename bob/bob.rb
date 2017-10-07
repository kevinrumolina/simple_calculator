puts "Digite el numero de grillas que desea crear"
grids = gets.chomp
grids = grids.to_i

def grids_creation
  puts "Digite el Alto y el Ancho de la grilla separados por un espacio"
  m_n = gets.chomp
  m_n = m_n.scan(/[0-9]+/)
  m = m_n[0].to_i
  n = m_n[1].to_i
  puts "Su grilla tiene #{m} filas y #{n} columnas"
end

def grid_generation
  m_counter = 1
  n_counter = 1
  for m > m_counter
    fila = ""
    for n > n_counter
      puts "Digite el espacio #{n_counter} de la fila #{m}"
      add = gets.chomp
      fila = fila + "#{add} "
      n_counter = n+1
    end
  end
end
grid_creation
