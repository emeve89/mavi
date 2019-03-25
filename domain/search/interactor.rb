require_relative 'response_model'

module Domain
  module Search
    # Class that is responsible for performing
    # a search action on a injected search engine.
    class Interactor
      include Import['elastic_search.search', 'search_presenter']

      def call(request_model)
        response_model = Domain::Search::ResponseModel.new(
          results: search.call(request_model)
        )
        search_presenter.call(response_model)
      end
    end
  end
end
