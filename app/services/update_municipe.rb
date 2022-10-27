class UpdateMunicipe
  attr_reader :municipe

  def initialize(params:, municipe:)
    @params   = params
    @municipe = municipe
  end

  def submit
    if @municipe.update(@params)
      send_mail

      return true
    end

    false
  end

  def send_mail(mailer: MunicipeMailer)
    mailer.updated(@municipe).deliver_later
  end
end
