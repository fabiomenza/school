class EventController < ApplicationController
  
  before_action :authenticate_admin!, only: [:index, :new, :create, :destroy, :edit,:update]
  add_breadcrumb 'Events', :events_path
  add_breadcrumb "Index for event", :event_index_path, only: [:index, :new, :edit]
  
  def view
	e = Event.find(params[:id])
	@title = @name = e.name
	@description = e.description
	@time = e.time
	
  	add_breadcrumb e.name, event_path(e)
	build_links
  end
  def get_involved
	e = Event.find(params[:id])
	@title = @name = e.name
	@description = e.get_involved
	build_links
  	add_breadcrumb e.name, event_path(e)
  end

  def index
    @events=Event.order('name ASC').paginate(page: params[:page])

    
  end

  def new
	@event=Event.new
  add_breadcrumb 'New', new_event_path
  end

  def create
    @event=Event.new
    @event.name=params[:event][:name]
    @event.description=params[:event][:description]
    @event.get_involved=params[:event][:get_involved]
    @event.event_type_id=params[:event_type]
    @event.structure_id=params[:structure]
    if @event.save
      redirect_to event_index_path
    else
      render 'edit'
    end
    
  end

  def edit
	@event = Event.find(params[:id])
  add_breadcrumb 'Edit', edit_event_path(@event)

  end

  def update
    @event=Event.find(params[:id])
    @event.name=params[:event][:name]
    @event.description=params[:event][:description]
    @event.get_involved=params[:event][:get_involved]
    @event.event_type_id=params[:event_type]
    @event.structure_id=params[:structure]
    if @event.save
      redirect_to event_index_path
    else
      render 'edit'
    end
    
  end

  def destroy
    @event=Event.find params[:id]
    @event.destroy

    redirect_to event_index_path
    
  end

  def build_links
	structural_links
	semantic_links
  end
  def structural_links
	e = Event.find(params[:id])
	@struct_links = Array.new
	@struct_links << {:name => "Description",:value => "/event/#{e.id}/"}
	@struct_links << {:name => "Get involved",:value => "/event/#{e.id}/get_involved"}
  end
  def semantic_links
	e = Event.find(params[:id])
	@semant_links = Array.new
	if e.structure
		@semant_links << {:name => "Hosted at #{e.structure.name}",:value => "/structure/#{e.structure.id}"}
	end
  end
end
