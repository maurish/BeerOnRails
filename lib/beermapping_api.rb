class BeermappingApi
  def self.places_in(city)
  	city = city.downcase
    Rails.cache.fetch(city, expires_in: 7.days){fetch_places_in city}
  end

  def self.find_by_id_and_city id,city
  	places_in(city).find{|place| place.id == id}
  end

  private

  def self.fetch_places_in city
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
  	Settings.beermapping_apikey
  end
end
