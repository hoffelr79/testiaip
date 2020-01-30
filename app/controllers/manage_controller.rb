class ManageController < ApplicationController
	before_action :authenticate_user!


	def get_new_records
		@news= newest
	end


	def save_newest
		data  = newest
		result = data.each do |ins|
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

		if result
			@response = "Registros almacenados"
		else
			@response = "Error, algo ocurrió"
		end

	end

	def download_csv
		institutions = Institution.all
		respond_to do |format|
			format.html
			format.csv { send_data institutions.to_csv, filename: "institutions-#{Date.today}.csv" }
		end
    end

	def index
		@institutions = Institution.order(:name).page(params[:page])
	end

	protected 

	def newest 
		institutions =  HTTParty.get('https://www.transparencia.gob.sv/api/v1/institutions.json?end_at=2018-01-31')
		news = [] 
		olds = Institution.all.pluck(:id_api)
		institutions.parsed_response.each do |ins|
			next if olds.include?(ins['id'].to_i)

			news << ins
		end

		return news
	end

end
