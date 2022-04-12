# frozen_string_literal: true

module MethodFinancial
  class Client
    class << self
      class_attribute :api_base_url
      self.api_base_url = ENV['METHOD_FINANCIAL_URL']

      def request(method, path, params = {})
        response = connection.send(method, path, params) do |request|
          request.url path
          request.headers["Authorization"] = "Bearer #{ENV["METHOD_FINANCIAL_TOKEN"]}"
          request.headers["Content-Type"] = "application/json"
          request.body = params.to_json
        end
        response_body = JSON.parse(response.body, object_class: OpenStruct)
        return response_body.data if response.success?

        raise MethodFinancial::Errors.new(response_body)
      end

      private

      attr_reader :response, :path

      def connection
        @connection ||= Faraday.new(url: api_base_url) do |faraday|
          faraday.request :url_encoded
          faraday.response :logger
          faraday.adapter Faraday.default_adapter
        end
      end
    end
  end
end
