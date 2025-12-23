# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Wine.destroy_all

[
  ['K-0113', "NERO D'AVOLA SYRAH", 2017, nil],
  ['K-0495', 'BEAUJOLAIS NOUVEAU 2018 Nicolas', 2018, nil],
  ['K-0093', 'PINOT GRIS ALSACE', 2015, nil],
  ['K-0060', 'TENTATION DU PASTEUR', 2010, 14]
].each do |xl_id, name, year, note|
  Wine.create!(
    xl_id:,
    name:,
    year:,
    note:
  )
end
