require 'dry-container'
require 'dry-auto_inject'

module Domain
  # IoC Container
  class Container
    extend Dry::Container::Mixin

    register 'search_controller' do
      Adapters::Controllers::SearchController.new
    end

    register 'search_presenter' do
      Adapters::Presenters::SearchPresenter.new
    end

    register 'elastic_search.search' do
      Adapters::Gateways::ElasticSearch::Search.new
    end

    register 'search_interactor' do
      Domain::Search::Interactor.new
    end
  end
end

Import = Dry::AutoInject(Domain::Container)

require_relative '../adapters/controllers/search_controller'
require_relative '../adapters/presenters/search_presenter'
require_relative '../adapters/gateways/elastic_search/search'
require_relative '../domain/search/interactor'
