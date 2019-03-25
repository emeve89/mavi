require 'elasticsearch'

desc 'Clones the repository where the DXL scripts are stored'
task :clone_tmpc_repo do
  require 'git'
  repo_url = ENV['REPO_URL'] || 'git.itd-intern.de/gitblit/r/TMPC.git'
  Git.clone("https://#{ENV['GIT_USER']}:#{ENV['GIT_PASSWORD']}@#{repo_url}", ENV['REPO_PATH'], depth: 1)
end

desc 'Create ElasticSearch Index'
task :create_index do
  client.indices.create(
    index: 'mavi',
    body: {
      settings: {
        analysis: {
          analyzer: {
            ngram: {
              tokenizer: 'whitespace',
              filter: %w[lowercase stop ngram],
              type: 'custom'
            },
            ngram_search: {
              tokenizer: 'whitespace',
              filter: %w[lowercase stop],
              type: 'custom'
            }
          }
        }
      },
      mappings: {
        scripts: {
          properties: {
            file_name: { type: 'text', analyzer: 'snowball' },
            file_path: { type: 'text', analyzer: 'snowball' },
            tags: { type: 'text', analyzer: 'snowball' }
          }
        }
      }
    }
  )
end

desc 'Delete ElasticSearch Index'
task :delete_index do
  client.indices.delete index: 'mavi'
end

def client
  Elasticsearch::Client.new url: ENV['ELASTICSEARCH_URL']
end
