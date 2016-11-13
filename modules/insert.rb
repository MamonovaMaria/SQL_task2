module Inserting
    def insert_cities
        cities.insert(:city_name => 'Erfurt', :city_country => 'Germany')
        cities.insert(:city_name => 'San-Francisco', :city_country => 'USA')
        cities.insert(:city_name => 'Capetown', :city_country => 'South Africa')
        cities.insert(:city_name => 'Pekin', :city_country => 'China')
        cities.insert(:city_name => 'Essen', :city_country => 'Germany')
        cities.insert(:city_name => 'Hamburg', :city_country => 'Germany')
        cities.insert(:city_name => 'Atlanta', :city_country => 'USA')
    end

    def insert_students
        cities.insert(:name => 'Mark', :surname => 'Schmidt', :course => 3, :is_male => true, :city_id => 1)
        cities.insert(:name => 'Helen', :surname => 'Hunt', :course => 2, :is_male => false, :city_id =>2)
        cities.insert(:name => 'Matumba', :surname => 'Zuko', :course => 4, :is_male => true, :city_id =>3)
        cities.insert(:name => 'Rin', :surname => 'Kupo', :course => 4, :is_male => false, :city_id =>3)
        cities.insert(:name => 'Zhen', :surname => 'Chi Bao', :course => 2, :is_male => true, :city_id =>4)
        cities.insert(:name => 'Peter', :surname => 'Zimmer', :course => 3, :is_male => true, :city_id =>5)
        cities.insert(:name => 'Hanz', :surname => 'Mueller', :course => 3, :is_male => true, :city_id =>6)
        cities.insert(:name => 'Alisa', :surname => 'Kepler', :course => 4, :is_male => false, :city_id =>1)
        cities.insert(:name => 'Anna', :surname => 'Madavie', :course => 2, :is_male => false, :city_id =>7)
    end
end
