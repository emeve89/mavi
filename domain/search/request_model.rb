require 'dry-struct'

module Domain
  module Search
    # Request model for a Search use case.
    # This request model is created by the controller
    # and then passed to the interactor
    class RequestModel < Dry::Struct
      attribute :q, Dry::Types['string']
      attribute :from, Dry::Types['coercible.integer']
      attribute :size, Dry::Types['coercible.integer']
    end
  end
end
