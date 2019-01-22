module Api
  module Controllers
    module Options
      class Index
        include Api::Action
        accept :json

        def call(params)
          headers.merge!({
            'Access-Control-Allow-Credentials' => 'true',
            'Access-Control-Allow-Methods' => 'GET, POST, PUT, PATCH, DELETE, OPTIONS, HEAD',
            'Access-Control-Allow-Headers' => 'content-type',
            'Access-Control-Allow-Origin' => 'http://localhost:9000',
            'Access-Control-Max-Age' => '1728000',
            'Content-Type' => 'text/plain'
          })
        end

      end
    end
  end
end
