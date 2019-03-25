require_relative '../../domain/domain'

module Adapters
  module Controllers
    # Adapter class that receives a request from the routing system
    # and creates a request model that is passed to the interactor
    class SearchController
      include Import['search_interactor']

      def call(request)
        request_model = {
          q: request.fetch('q', '')
        }
        search_interactor.call(request_model)
      end
    end
  end
end
