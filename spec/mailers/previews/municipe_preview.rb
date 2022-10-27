# Preview all emails at http://localhost:3000/rails/mailers/municipe
class MunicipePreview < ActionMailer::Preview
  def registered
    municipe = FactoryBot.create(:municipe)

    MunicipeMailer.registered(municipe)
  end

  def updated
    municipe = FactoryBot.create(:municipe)

    MunicipeMailer.updated(municipe)
  end
end
