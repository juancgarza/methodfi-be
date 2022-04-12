module MethodFinancial
  class Entities
    def self.get(entity_id)
      path = "entities/#{entity_id}"
      MethodFinancial::Client.request(:get, path)
    end

    def self.index(params = {})
      path = 'entities'
      MethodFinancial::Client.request(:get, path, params)
    end

    def self.update(entity_id, params)
      path = "entities/#{entity_id}"
      MethodFinancial::Client.request(:put, path, params)
    end

    def self.create(params)
      path = 'entities'
      MethodFinancial::Client.request(:post, path, params)
    end
  end
end
