require 'elasticsearch'

module Adapters
  module Gateways
    module ElasticSearch
      # Implementation of a search function usign ElasticSearch
      class Search
        def initialize
          @client = Elasticsearch::Client.new url: ENV['ELASTICSEARCH_URL']
        end

        def call(params)
          raw_results_for(params[:q]).map do |result|
            {
              file_name: result['_source']['file_name'],
              file_path: result['_source']['file_path'],
              tags: result['_source']['tags'],
              id: result['_id']
            }
          end
        end

        private

        attr_reader :client

        def raw_results_for(keyword)
          client.search(index: 'mavi',
                        body: {
                          query: { match: { file_name: keyword } },
                          from: 0,
                          size: 10
                        })['hits']['hits']
        end
      end
    end
  end
end
