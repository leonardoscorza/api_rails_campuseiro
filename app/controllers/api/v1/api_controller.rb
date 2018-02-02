module Api::V1
  
  class ApiController < ApplicationController
    include Knock::Authenticable
    include CanCan::ControllerAdditions
    load_and_authorize_resource    
    
    
    #> Métodos globais  
  end

end