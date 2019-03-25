module Adapters
  module Gateways
    module ElasticSearch
      # Implementation of a search function usign ElasticSearch
      class Search
        def call(params)
          [
            { id: 1, file_name: 'name1', file_path: 'path1' },
            { id: 2, file_name: 'name2', file_path: 'path2' }
          ]
        end
      end
    end
  end
end
