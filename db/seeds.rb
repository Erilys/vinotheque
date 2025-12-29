# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'faker'

Wine.destroy_all

[
  ['K-0113', "NERO D'AVOLA SYRAH", 2017],
  ['K-0495', 'BEAUJOLAIS NOUVEAU 2018 Nicolas', 2018],
  ['K-0093', 'PINOT GRIS ALSACE', 2015],
  ['K-0092', 'PINOT GRIS ALSACE', 2017],
  ['K-0060', 'TENTATION DU PASTEUR', 2010],
  ['K-0062', 'TENTATION DU PASTEUR', 2012],
  ['K-0063', 'NUITS SAINT GEORGE', 2016],
  ['K-0012', "PAYS D'OC blanc sauvignon", 2013],
  ['K-0017', "LA FAVEUR DES MUSES Ollon Chasselas", 2013]
].each do |xl_id, name, year, note|
  Wine.create!(
    xl_id:,
    name:,
    year:
  )
end

Location.destroy_all
%w[
  2A 2B 2C 2D 2E 2F 2G 2H A B C D E F G H I J K L M N S
].each do |location_name|
  Location.create!(name: location_name, slots: rand(16..20))
end
first_location = Location.first
last_location = Location.last

Purchase.destroy_all

PurchaseItem.destroy_all
Wine.find_each do |wine|
  purchase = Purchase.new(
    wine:,
    store: Faker::Commerce.brand,
    town: 'Menton',
    price_per_bottle_in_cents: rand(100...100000),
    purchase_date: Faker::Date.backward(days: 365)
  )
  purchase.purchase_items.build(location: first_location, quantity: 3)
  purchase.purchase_items.build(location: last_location, quantity: 2)
  purchase.save!
end

Event.destroy_all
Drink.destroy_all
event = Event.new(
  start_date: Time.zone.today,
  name: 'Christmas 2025',
  comment: 'Merry Christmas !',
  comment_wine: 'Good stuff'
)
drink = event.drinks.build(
  note: 18, comment: 'fameux', wine: Wine.first,
  location: first_location, quantity: 2
)
event.save!

event = Event.new(
  start_date: Time.zone.today,
  name: 'Christmas 2026',
  comment: 'Merry Christmas !',
  comment_wine: 'Good stuff'
)
drink = event.drinks.build(
  note: 8, comment: 'pas terrible', wine: Wine.first,
  location: last_location, quantity: 2
)
event.save!
