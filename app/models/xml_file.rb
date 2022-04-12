class XmlFile < ApplicationRecord
  after_create :process_file

  def process_file
    ProcessFileWorker.perform_async(self.id)
  end
end
