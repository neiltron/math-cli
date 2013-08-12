require 'httparty'

module Mathlog
  class API

    include HTTParty
    base_uri 'http://math.dev'

    def self.submit (data)

      data = data.merge({ accesskey: ENV['MATH_APIKEY'] })
      self.post("/api/1/users/#{ENV['MATH_USERID']}/records.json", query: data)

    end

  end
end