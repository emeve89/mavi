require 'dry-struct'

module Domain
  module Search
    # Response model of a Search use case.
    # This response model is created by the interactor
    # and then passed to the presenter
    class ResponseModel < Dry::Struct
      attribute :results, Dry::Types['array<hash>']
    end
  end
end
