class Ticket < ApplicationRecord
  has_many :comments, dependent: :destroy
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks


  after_commit :index_document, on: %i[create update]
  after_commit :delete_document, on: :destroy

  # Define methods for Elasticsearch search queries
  def self.search(query)
    puts query
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            type: 'phrase_prefix'
          }
        }
      }
    )
  end

  private
  def index_document
    __elasticsearch__.index_document
  end

  def delete_document
    __elasticsearch__.delete_document
  end
end
