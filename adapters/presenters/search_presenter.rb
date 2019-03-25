module Adapters
  module Presenters
    # This class receives a response model from the interactor
    # and creates a view model that is passed to the view
    class SearchPresenter
      def call(response_model)
        view_model = response_model.map do |model|
          { file_name: model[:file_name], file_path: model[:file_path] }
        end
        view_model
      end
    end
  end
end
