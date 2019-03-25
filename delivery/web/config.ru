require 'roda'
require_relative '../../adapters/adapters'
require_relative '../../domain/container'

module Delivery
  module Web
    # Web application that acts as a delivery mechanism
    class App < Roda
      plugin :render, engine: 'slim', views: 'delivery/web/views'
      include Import['search_controller']

      route do |r|
        # GET / request
        r.root do
          r.redirect '/search'
        end

        # GET /search branch
        r.get 'search' do
          view_model = search_controller.call(r.params)
          view 'search', locals: {view_model: view_model}
        end
      end
    end
  end
end

run Delivery::Web::App.freeze.app
