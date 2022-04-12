# frozen_string_literal: true
require 'nokogiri'

class ProcessFileWorker
  include Sidekiq::Worker

  def perform(file_id)
    file = XmlFile.find(file_id)
    xml_file = Nokogiri::XML(file.data)
    FileUploadHandler.new(xml_file).process
  end
end
