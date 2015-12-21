class IncidentsController < ApplicationController
  def index
    @incidents = Incident.all
  end
  def show
    @incident = Incident.find_by(id: params[:id])
  end
  def new
  end
  def create
    @incident = Incident.create(
        murderer_first_name: params[:murderer_first_name],
        murderer_last_name: params[:murderer_last_name],
        birthdate: params[:birthdate],
        location: params[:location],
        weapon: params[:weapon],
        number_of_victims: params[:number_of_victims],
        sentence: params[:sentence]
      )
    redirect_to "/incidents"
  end
  def edit
    @incident = Unirest.get("http://localhost:3000/incidents/#{params[:id]}.json").body
  end
  def update
    @incident = Unirest.patch("http://localhost:3000/incidents/#{params[:id]}.json",
      parameters: { 
        murderer_first_name: params[:murderer_first_name],
        murderer_last_name: params[:murderer_last_name],
        birthdate: params[:birthdate],
        location: params[:location],
        weapon: params[:weapon],
        number_of_victims: params[:number_of_victims],
        sentence: params[:sentence]
        }
      )
    redirect_to "/incidents"
  end
  def destroy
    @incident = Unirest.delete("http://localhost:3000/incidents/#{params[:id]}.json",
      parameters: {
        id: params[:id]
        })
    redirect_to '/incidents'
  end
end
