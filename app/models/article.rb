class Article < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  mapping do
    indexes :title, type: 'text'
    indexes :body, type: 'text'
  end

  def self.search(query)
    params = {
      query: {
        multi_match: {
          query: query,
          fields: %w[body title],
          fuzziness: 'AUTO'
        }
      }
    }

    __elasticsearch__.search(params).records.to_a
  end
end
