require 'elasticsearch/model'
require 'elasticsearch/dsl'
Elasticsearch::Model.client = Elasticsearch::Client.new host: ENV['ELASTICSEARCH_URL'] || "localhost:9200", log: true
