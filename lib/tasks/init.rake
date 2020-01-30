desc "load institutions"
task  :load_ins => :environment do
	institutions = HTTParty.get('https://www.transparencia.gob.sv/api/v1/institutions.json')
	data  = institutions.parsed_response
	data.each do |ins|
		puts "j"
		Institution.find_or_create_by(
			id_api: ins['id'],
			name: ins['name'],
			facebook_url: ins['facebook_url'],
			acronym: ins['acronym'],
			facebook_username: ins['facebook_username'],
			officer_name: ins['officer_name']
			)
	end
  
end

