class ZipCodeApi
  def initialize(zip_code)
    @zip_code = zip_code
  end
  
  def call
    response = Faraday.get "https://viacep.com.br/ws/#{@zip_code}/json/"    
    uf = JSON.parse(response.body)["uf"]
  end
end