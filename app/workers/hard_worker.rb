class HardWorker
  include Sidekiq::Worker

  def perform()

ExampleMailer.sample_email.deliver_now!
  end
end
