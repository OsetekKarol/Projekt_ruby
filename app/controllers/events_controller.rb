class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]
  
    def index
      @events = Event.all
    end
  
    def show
      @users = @event.users
    end
  
    def new
      @event = Event.new
    end
  
    def create
      @event = Event.new(event_params)
      if @event.save
        redirect_to @event, notice: 'Event created successfully!'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      # @event jest już ustawione przez before_action
    end
  
    def update
      if @event.update(event_params)
        flash[:notice] = "Event successfully updated."
        redirect_to @event
      else
        flash[:alert] = "There was an error updating the event."
        render :edit
      end
    end
  
    def destroy
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to events_path, notice: "Event was successfully deleted."
    end
    
  
    private
  
    def set_event
      @event = Event.find(params[:id])
    end
  
    def event_params
      params.require(:event).permit(:title, :description, :date, category_ids: [], user_ids: [])
    end
  end
  