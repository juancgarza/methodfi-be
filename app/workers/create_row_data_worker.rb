class CreateRowDataWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(row)
  end
end