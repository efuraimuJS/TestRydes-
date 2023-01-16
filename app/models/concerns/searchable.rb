module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    index_name [Rails.env, Rails.application.class.module_parent_name.underscore, self.name.downcase].join('_')
    #
    settings index: { number_of_shards: 1 } do
      mapping dynamic: 'false' do
        indexes :id, type: :integer
        indexes :account_type, type: :text
        indexes :email, type: :text
        indexes :avatar_url, type: :text
        indexes :full_name, type: :text
        indexes :username, type: :text
      end
    end

    def as_indexed_json(options = nil)
      self.as_json( only: [ :id, :account_type, :email, :avatar_url, :full_name, :username ]
      # , methods: :method_name
                  )
      # UserDenormalizer.new(self).to_hash
    end


  end
end
