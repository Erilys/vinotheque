# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'faker'

Wine.destroy_all

[
  ['K-0113', "NERO D'AVOLA SYRAH", 2017, nil],
  ['K-0495', 'BEAUJOLAIS NOUVEAU 2018 Nicolas', 2018, nil],
  ['K-0093', 'PINOT GRIS ALSACE', 2015, nil],
  ['K-0092', 'PINOT GRIS ALSACE', 2017, nil],
  ['K-0060', 'TENTATION DU PASTEUR', 2010, 14],
  ['K-0062', 'TENTATION DU PASTEUR', 2012, 13],
  ['K-0063', 'NUITS SAINT GEORGE', 2016, 16],
  ['K-0012', "PAYS D'OC blanc sauvignon", 2013, 10],
  ['K-0017', "LA FAVEUR DES MUSES Ollon Chasselas", 2013, 10]
].each do |xl_id, name, year, note|
  Wine.create!(
    xl_id:,
    name:,
    year:,
    note:
  )
end

Location.destroy_all
%w[
  2A 2B 2C 2D 2E 2F 2G 2H A B C D E F G H I J K L M N S
].each do |location_name|
  Location.create!(name: location_name)
end

Entry.destroy_all
Wine.find_each do |wine|
  Entry.create!(
    wine:,
    quantity: rand(1..12),
    store: Faker::Commerce.brand,
    town: 'Menton',
    price_per_bottle_in_cents: rand(100...100000),
    purchase_date: Faker::Date.backward(days: 365)
  )
end
