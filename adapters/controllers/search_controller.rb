require_relative '../../domain/domain'

module Adapters
  module Controllers
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
