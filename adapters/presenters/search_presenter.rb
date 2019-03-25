module Adapters
  module Presenters
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
