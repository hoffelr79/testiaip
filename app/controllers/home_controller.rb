class HomeController < ApplicationController

	def index
		@institutions = Institution.order(:name).page params[:page]

	end

	def all_institutions
		data =  HTTParty.get('https://www.transparencia.gob.sv/api/v1/institutions.json')
		@institutions = data.parsed_response

	end
end
