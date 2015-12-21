class Incident
  attr_accessor :id, :murderer_first_name, :murderer_last_name, :birthdate, :location, :weapon, :number_of_victims, :sentence

  def initialize(input_attrib)
    @id = input_attrib["id"]
    @murderer_first_name = input_attrib["murderer_first_name"]
    @murderer_last_name = input_attrib["murderer_last_name"]
    @birthdate = input_attrib["birthdate"]
    @location = input_attrib["location"]
    @weapon = input_attrib["weapon"]
    @number_of_victims = input_attrib["number_of_victims"]
  end
  def self.find_by(input_attrib)
    id = input_attrib[:id]
    incident_options_hash = Unirest.get("http://localhost:3000/incidents/#{id}.json").body
    Incident.new(incident_options_hash)    
  end
  def self.all
    all = Unirest.get("http://localhost:3000/incidents.json").body #array coming from unirest
    array = [] #create new array
    all.each do |hash| #cycle through unirest array of hashes
      incident = Incident.new(hash) #creating objects with each unirest hash
      array << incident
    end
    array
  end
  def self.create(input_attrib)
      incident_options_hash = Unirest.post("http://localhost:3000/incidents.json", 
      headers: { "Accept" => "application/json" },
      parameters: input_attrib).body
      Incident.new(incident_options_hash)
  end
  # def edit
  #   incident_options_hash = Unirest.get("http://localhost:3000/incidents/#{id}.json").body
  #   Incident.new(incident_options_hash)
  # end
  def destroy
    
  end
end