class ExampleMailer < ApplicationMailer


  default from: "girmal5@gmail.com"

  def sample_email
    mail(to:"girmalruby@gmail.com", subject: 'Sample Email')
  end

end
