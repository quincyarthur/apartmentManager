namespace :populate_database do
  desc "Clear Tables"
  
  task clear_tables: :environment do
    Rake::Task['db:reset'].invoke #clears db
    Rake::Task['db:seed'].invoke #set up system tables
  end
  
  task populate_db: :environment do
    20.times do
       FactoryGirl.create(:landlord_with_properties_tenants_with_leases)
    end
   
  end
end
