class IncidentsController < ApplicationController
  def index
    @incidents = Unirest.get("http://localhost:3000/incidents.json").body
  end
  def show
    @incident = Unirest.get("http://localhost:3000/incidents/#{params[:id]}.json").body
  end
  def new
  end
  def create
    @incident = Unirest.post("http://localhost:3000/incidents.json", 
      headers: { "Accept" => "application/json" },
      parameters: { 
        murderer_first_name: params[:murderer_first_name],
        murderer_last_name: params[:murderer_last_name],
        birthdate: params[:birthdate],
        location: params[:location],
        weapon: params[:weapon],
        number_of_victims: params[:number_of_victims],
        sentence: params[:sentence]
        })
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
end
