module Domain
  module Interactors
    # Class that is responsible for performing a search on a injected search engine.
    class Search
      include Import['search_presenter']

      def call(_request_model)
        response_model = [
          { id: 1, file_name: 'name1', file_path: 'path1' },
          { id: 2, file_name: 'name2', file_path: 'path2' }
        ]
        search_presenter.call(response_model)
      end
    end
  end
end
