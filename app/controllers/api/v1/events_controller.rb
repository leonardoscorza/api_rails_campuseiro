class Api::V1::EventsController < Api::V1::ApiController
  before_action :authenticate_user, only: [:create, :destroy, :update, :comment]
  before_action :set_event, only: [:show, :update, :destroy, :comment]

  def index
    @events = Event.all
    
    render json: @events
  end

  def show
    render json: @event.as_json(include:[:users, :talks, :comments])
  end

  def create
    @event = Event.new(event_params.merge(user: current_user))
    
    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy    
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :begin_date, :end_date)
    end
end
