require 'elasticsearch'

desc 'Clones the repository where the DXL scripts are stored'
task :clone_tmpc_repo do
  require 'git'
  repo_url = ENV['REPO_URL'] || 'git.itd-intern.de/gitblit/r/TMPC.git'
  Git.clone(
    "https://#{ENV['GIT_USER']}:#{ENV['GIT_PASSWORD']}@#{repo_url}",
    ENV['REPO_PATH'],
    depth: 1
  )
end

desc 'Create ElasticSearch Index'
task :create_index do
  require 'json'
  index_definition = JSON.parse(
    File.read(File.join(Dir.pwd, '/es_index_definition.json')),
    symbolize_names: true
  )
  client.indices.create(index_definition)
end

desc 'Delete ElasticSearch Index'
task :delete_index do
  client.indices.delete index: 'mavi'
end

def client
  Elasticsearch::Client.new url: ENV['ELASTICSEARCH_URL']
end
