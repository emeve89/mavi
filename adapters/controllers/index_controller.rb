require_relative '../../domain/container'

module Adapters
  module Controllers
    # Adapter class that receives a request from the routing system
    # and creates a request model that is passed to the interactor
    class IndexController
      include Import['index_interactor']

      def call
        index_interactor.call
      end
    end
  end
end
