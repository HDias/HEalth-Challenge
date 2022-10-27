class CreateMunicipe
  attr_reader :municipe

  def initialize(params:, municipe: Municipe)
    @params   = params
    @municipe = municipe
  end

  def submit
    @municipe = @municipe.new(@params)

    return false unless @municipe.valid?

    send_mail if @municipe.save

    true
  end

  def send_mail(mailer: MunicipeMailer)
    mailer.registered(@municipe).deliver_later
  end
end
