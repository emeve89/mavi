require 'dry-struct'

module Domain
  module Index
    # Response model of a Index use case.
    # This response model is created by the interactor
    # and then passed to the presenter
    class ResponseModel < Dry::Struct
      attribute :succeded, Dry::Types['bool']

      def message
        if succeded
          'DXL Scripts indexed successfully'
        else
          'There was an error wehn trying to index the scripts'
        end
      end
    end
  end
end
