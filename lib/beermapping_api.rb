class BeermappingApi
  def self.places_in(city)
    #url = "http://beermapping.com/webservice/loccity/#{key}/"
    url = "http://stark-oasis-9187.herokuapp.com/api/"
    city = ERB::Util.url_encode city
    response = HTTParty.get "#{url}#{city}"
    places = response.parsed_response["bmp_locations"]["location"]

    return [] if places.is_a?(Hash) and places['id'].nil?

    places = [places] if places.is_a?(Hash)
    places.inject([]) do | set, place |
      set << Place.new(place)
    end
  end

  def self.key
    "fabfff47f366053c50c633bb9b8739a9"
  end
end
