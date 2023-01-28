# require 'elasticsearch/model'
# require 'elasticsearch/dsl'
# Elasticsearch::Model.client = Elasticsearch::Client.new host: ENV['ELASTICSEARCH_URL'] || "localhost:9200", log: true
#
# class ActiveRecord::Base
#   cattr_accessor :skip_elasticsearch_callbacks
# end
#
# ActiveRecord::Base.skip_elasticsearch_callbacks = true
