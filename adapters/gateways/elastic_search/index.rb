require 'elasticsearch'

module Adapters
  module Gateways
    module ElasticSearch
      # Implementation of a index function using ElasticSearch
      class Index
        def initialize
          @client = Elasticsearch::Client.new url: ENV['ELASTICSEARCH_URL']
        end

        def call(data)
          client.bulk(body: formatted_body_for(data))
        end

        private

        attr_reader :client

        def id_for(file_path)
          Digest::SHA1.hexdigest(file_path)
        end

        def formatted_body_for(data)
          data.map do |file_info|
            {
              index: { _index: 'mavi', _type: 'scripts', _id: id_for(file_info[:file_path]), data: file_info }
            }
          end
        end
      end
    end
  end
end