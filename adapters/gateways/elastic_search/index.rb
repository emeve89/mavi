require 'elasticsearch'

module Adapters
  module Gateways
    module ElasticSearch
      # Implementation of a index function using ElasticSearch
      class Index
        def initialize
          @client = Elasticsearch::Client.new url: ENV['ELASTICSEARCH_URL']
        end

        def call(id, body)
          client.index(
            index: 'mavi',
            type: 'scripts',
            id: id,
            body: body
          )
        end

        private

        attr_reader :client
      end
    end
  end
end
