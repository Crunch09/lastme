require 'net/http'
require 'json'

module Lastme
  class Connection

    def fetch_token
      params = {
        'api_key' => ENV['LASTME_API_KEY'],
        'method' => 'auth.gettoken'
      }
      response = request params
      response['token']
    end

    def fetch_session
      params = {
        'method' => 'auth.getSession',
        'api_key' => ENV['LASTME_API_KEY'],
        'token' => fetch_token
      }
      response = authorized_request params
      response['session']
    end

    private

    def request params
      parameters = URI.escape(params.collect{|k,v| "#{k}=#{v}"}.join('&'))
      response = Net::HTTP.get_response(Lastme::BASE_URI,"/2.0?{parameters}&format=json")
      JSON.parse(response.body)
    end

    def authorized_request params
      api_sig = create_signature params
      params['api_sig'] = api_sig
      request params
    end

    def create_signature params
      s = ""
      params.sort.map do |key,value|
        s += "#{key}#{value}"
      end
      s += ENV['LASTME_SECRET']
      Digest::MD5.hexdigest s
    end
  end
end
