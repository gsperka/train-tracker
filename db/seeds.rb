# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seed_data = File.read("public/trains.json")
json = JSON.parse(seed_data)

json["data"].each do |departure|
	Transportation.create(
		train_line: departure["trainLine"], 
		route: departure["routeName"], 
		run_number: departure["runNumber"], 
		operator_id: departure["operatorId"] )
end