Grade.destroy_all
State.destroy_all
Country.destroy_all
User.destroy_all

Country.create!(name: 'México')
User.create!(email: 'zalapeach@gmail.com')

[
  '1er Dan', '2do Dan', '3er Dan', '4to Dan', '5to Dan', '6to Dan', '7mo Dan',
  '8vo Dan', '9no Dan', '1er Poom', '2do Poom', '3er Poom', '10mo Kup',
  '9no Kup', '8vo Kup', '7mo Kup', '6to Kup', '5to Kup', '4to Kup', '3er Kup',
  '2do Kup', '1er Kup'
].each do |grade|
  Grade.create!(name: grade)
end

[
  'Aguascalientes', 'Baja California', 'Baja California Sur', 'Campeche',
  'Chiapas', 'Chihuahua', 'Ciudad de México', 'Coahuila', 'Colima', 'Durango',
  'Estado de México', 'Guerrero', 'Guanajuato', 'Hidalgo', 'Jalisco',
  'Michoacan', 'Morelos', 'Nayarit', 'Nuevo León', 'Oaxaca', 'Puebla',
  'Queretaro', 'Quintana Roo', 'San Luis Potosi', 'Sinaloa', 'Sonora',
  'Tabasco', 'Tamaulipas', 'Tlaxcala', 'Veracruz', 'Yucatán', 'Zacatecas'
].each do |state|
  State.create!(name: state, country: Country.first)
end
