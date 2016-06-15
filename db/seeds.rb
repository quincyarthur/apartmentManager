# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

 Category.create([{name:'Leisure'},{name:'Retail'},{name:'Office'},{name:'Industrial'},{name:'Healthcare'},{name:'Multifamily'}])
 
 Amenity.create([{name:'Air Conditioning'},{name:'Washer'},{name:'Dryer'},{name:'Pool'},{name:'Gym'},{name:'Electricity'},{name:'Water'}, 
                 {name:'Cable'},{name:'Telephone'},{name:'Internet'},{name:'Game Room'},{name:'Theater'},{name:'Community Lounge'}, 
                 {name:'Partially Furnished'},{name:'Fully Furnished'},{name:'Beach Access'},{name:'Gated Community'}])
                
 Subscription.create([{name:'Basic',amount:0.00},{name:'Premium',amount:30.00}])
 
 Island.create([{name:'New Providence'},{name:'Eleuthera'},{name:'Harbour Island'},{name:'Berry Island'},{name:'Inagua'},
                {name:'Grand Bahama'},{name:'Andros'},{name:'Exuma'},{name:'Mayaguana'},{name:'Abaco'},{name:'San Salvador'},
                {name:'Acklins'},{name:'Crooked Island'},{name:'Rum Cay'},{name:'Ragged Island'},{name:'Cat Island'},{name:'Long Island'}, 
                {name:'Bimini'}])
