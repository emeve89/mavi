require 'dry-container'
require 'dry-auto_inject'

module Domain
  # IoC Container
  class Container
    extend Dry::Container::Mixin

    register 'search_controller' do
      Adapters::Controllers::SearchController.new
    end

    register 'index_controller' do
      Adapters::Controllers::IndexController.new
    end

    register 'search_presenter' do
      Adapters::Presenters::SearchPresenter.new
    end

    register 'index_presenter' do
      Adapters::Presenters::IndexPresenter.new
    end

    register 'search_engine.search' do
      Adapters::Gateways::ElasticSearch::Search.new
    end

    register 'search_engine.index' do
      Adapters::Gateways::ElasticSearch::Index.new
    end

    register 'vcs.update_repo' do
      Adapters::Gateways::Git::UpdateRepo.new
    end

    register 'search_interactor' do
      Domain::Search::Interactor.new
    end

    register 'index_interactor' do
      Domain::Index::Interactor.new
    end
  end
end

Import = Dry::AutoInject(Domain::Container)

require_relative '../adapters/controllers/search_controller'
require_relative '../adapters/controllers/index_controller'
require_relative '../adapters/presenters/search_presenter'
require_relative '../adapters/presenters/index_presenter'
require_relative '../adapters/gateways/elastic_search/search'
require_relative '../adapters/gateways/elastic_search/index'
require_relative '../adapters/gateways/git/update_repo'
require_relative '../domain/search/interactor'
require_relative '../domain/index/interactor'
