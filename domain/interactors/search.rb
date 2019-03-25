module Domain
  module Interactors
    # Class that is responsible for performing
    # a search action on a injected search engine.
    class Search
      include Import['elastic_search.search', 'search_presenter']

      def call(request_model)
        response_model = search.call(request_model)
        search_presenter.call(response_model)
      end
    end
  end
end
