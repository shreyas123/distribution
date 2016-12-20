require 'net/http'
require 'uri'

module Zion
  class Source
    PASSPHRASE = 'Kans4s-i$-g01ng-by3-bye'
    GET_URL = 'http://challenge.distribusion.com/the_one/routes'
    POST_URL = 'http://challenge.distribusion.com/the_one/routes'

    def hack_matrix(params = {})
      uri = URI.parse(GET_URL)
      params.merge!(passphrase: PASSPHRASE)
      uri.query = URI.encode_www_form( params )
      return Net::HTTP.get(uri)
    end

    def inform_zion(params = {})
      uri = URI.parse(POST_URL)
      params.merge!(passphrase: PASSPHRASE)
      return Net::HTTP.post_form(uri, params)
    end
  end
end
