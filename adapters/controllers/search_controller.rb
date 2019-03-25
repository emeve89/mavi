require_relative '../../domain/container'
require_relative '../../domain/search/request_model'

module Adapters
  module Controllers
    # Adapter class that receives a request from the routing system
    # and creates a request model that is passed to the interactor
    class SearchController
      include Import['search_interactor']

      def call(request)
        request_model = Domain::Search::RequestModel.new(
          q: request.fetch(:q, ''),
          from: request.fetch(:from, 0),
          size: request.fetch(:size, 10)
        )
        search_interactor.call(request_model)
      end
    end
  end
end
