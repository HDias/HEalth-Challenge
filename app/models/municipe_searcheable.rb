module MunicipeSearcheable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mapping do
      indexes :name, type: :text
      indexes :cpf, type: :text
      indexes :cns, type: :text
      indexes :email, type: :text
    end

    def self.search(query)
      self.__elasticsearch__.search(query)
    end
  end
end
