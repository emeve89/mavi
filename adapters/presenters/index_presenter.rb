module Adapters
  module Presenters
    # This class receives a response model from the interactor
    # and creates a view model that is passed to the view
    class IndexPresenter
      def call(response_model)
        {
          message: message_for(response_model)
        }
      end

      private

      def message_for(response_model)
        if response_model.succeded
          'DXL Scripts indexed successfully'
        else
          'There was an error when trying to index the scripts'
        end
      end
    end
  end
end
