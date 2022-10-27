class UpdateMunicipe
  attr_reader :municipe

  def initialize(params:, municipe:)
    @params   = params
    @municipe = municipe
  end

  def submit
    send_mail if @municipe.update(@params)

    true
  end

  def send_mail(mailer: MunicipeMailer)
    mailer.updated(@municipe).deliver_later
  end
end
