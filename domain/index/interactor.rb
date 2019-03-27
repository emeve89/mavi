require_relative '../container'
require_relative 'response_model'

module Domain
  module Index
    # Class that collects data from the files and
    # the update the searche engine index
    class Interactor
      include Import['vcs.update_repo', 'search_engine.index', 'index_presenter']

      def call
        update_repo.call
        data = files_to_index.map { |file| data_to_index_for(file) }
        index.call(data)
        index_presenter.call(Domain::Index::ResponseModel.new(succeded: true))
      end

      private

      def files_to_index
        @files_to_index ||= Dir.glob("#{ENV['REPO_PATH']}/**/*.dxl")
      end

      def data_to_index_for(file)
        {
          file_path: File.expand_path(file),
          tags: ['TAG1'],
          file_name: File.basename(file, '.*')
        }
      end
    end
  end
end
