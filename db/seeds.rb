# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 Category.create([{name:'Residential'},{name:'Commercial'}])
 Property.create(landlord_id:1,category_id:1,island:'New Providence',street_name:'Carmichael Road',num_bedrooms:5,num_bathrooms:3,num_units:1,monthly_amt:2500,description:"nice")
 Property.create(landlord_id:1,category_id:2,island:'New Providence',street_name:'Carmichael Road',num_bedrooms:2,num_bathrooms:1,num_units:1,monthly_amt:600,description:"nice")
  Property.create(landlord_id:1,category_id:1,island:'Bimini',street_name:'Carmichael Road',num_bedrooms:3,num_bathrooms:2,num_units:1,monthly_amt:800,description:"nice")
   Property.create(landlord_id:1,category_id:2,island:'Eleuthera',street_name:'Carmichael Road',num_bedrooms:2,num_bathrooms:2,num_units:1,monthly_amt:700,description:"nice")