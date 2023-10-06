class EventsController < ApplicationController
	before_action :set_event, only: [:update, :edit, :show, :destroy]

	def index
		@events = current_user.events.all.order(created_at: :asc)
	end

	def new
		@event = Event.new
	end

	def create
		@event = current_user.events.create(event_params)
		if @event.save
			redirect_to event_path(@event)
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @event.update(event_params)
			redirect_to event_path(@event)
		else
			render :edit
		end
	end

	def destroy
		@event.destroy

		redirect_to root_path
	end

	private
		def set_event
			@event = Event.find(params[:id])
		end

		def event_params
			params.require(:post).permit(:caption, photos: [])
		end
end