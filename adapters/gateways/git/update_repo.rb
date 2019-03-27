require 'git'

module Adapters
  module Gateways
    module Git
      # This gateway clones the repo where the DXL scripts are stored.
      class UpdateRepo
        def call
          ::Git.init(ENV['REPO_PATH']).pull(ENV['REPO_PATH'], 'master')
        end
      end
    end
  end
end
