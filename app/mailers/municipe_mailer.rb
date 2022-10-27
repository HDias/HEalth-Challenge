class MunicipeMailer < ApplicationMailer
  default from: 'notifications@saude.com'

  def registered
    @municipe = params[:municipe]
    subject = 'Você foi registrado- Sistema de Saúde'

    mail(to: @municipe.email, subject:)
  end

  def updated
    @municipe = params[:municipe]
    subject = 'Seus dados foram atualizados- Sistema de Saúde'

    mail(to: @municipe.email, subject:)
  end
end
