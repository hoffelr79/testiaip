module Services
	class Data
	  include HTTParty
	  base_uri 'https://www.transparencia.gob.sv/api/v1'

	  def initialize(service, page)
	    @options = { query: { site: service, page: page } }
	  end

	  def institutions
	    self.class.get("/institutions.json", @options)
	  end
	end
end