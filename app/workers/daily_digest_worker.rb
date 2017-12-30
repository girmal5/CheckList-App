class DailyDigestWorker

  include Sidekiq::Worker
  include Sidetiq::Schedulable

Sidekiq_options :queue => :mailer

  reccurence {daily}

  def perform
    User.find_each do |user|
      DailyDigestWorker.digest_emai(user)
    end
  end

end
