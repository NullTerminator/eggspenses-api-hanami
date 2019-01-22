module RequestSpecHelper
  def self.included(group)
    group.instance_eval do
      include Rack::Test::Methods
      let(:app) { Hanami.app }

      before do
        @json_response = nil
      end
    end
  end

  def json_response
    @json_response ||= JSON.parse(last_response.body)['data']
  end
end
