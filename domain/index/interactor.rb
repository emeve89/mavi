require_relative '../container'

module Domain
  module Index
    # Class that collects data from the files and
    # the update the searche engine index
    class Interactor
      include Import['vcs.update_repo', 'search_engine.index']

      def call
        update_repo.call
        Dir.glob("#{ENV['REPO_PATH']}/**/*.dxl").each do |file|
          id = Digest::SHA1.hexdigest(file)
          body = {
            file_path: File.expand_path(file),
            # lines = File.foreach(file).map(&:strip),
            tags: ['TAG1'],
            file_name: File.basename(file, '.*')
          }
          index.call(id, body)
        end
      end
    end
  end
end
