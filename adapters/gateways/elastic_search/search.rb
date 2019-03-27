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
          raw_results_for(params).map do |result|
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

        def raw_results_for(params)
          client.search(index: 'mavi',
                        body: {
                          query: { match: { file_name: params[:q] } },
                          from: params[:from],
                          size: params[:size]
                        })['hits']['hits']
        end
      end
    end
  end
end
