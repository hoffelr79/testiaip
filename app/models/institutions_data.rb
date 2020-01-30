class InstitutionsData
  include HTTParty
  base_uri 'https://www.transparencia.gob.sv/api/v1'

  def initialize(page)
    @options = { query: { page: page } }
  end

  def institutions
    self.class.get("/institutions.json", @options)
  end
end
