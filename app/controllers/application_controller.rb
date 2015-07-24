class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def find_ip
    if request.remote_ip ==  "::1"
      response = Net::HTTP.get URI.parse('http://checkip.dyndns.org')
      response.match(/(?:Address: )([\d\.]+)/)[1]
    else
      request.remote_ip
    end
  end

  def get_location
    @get_location ||= Geocoder.search(find_ip)[0].data
  end

end
