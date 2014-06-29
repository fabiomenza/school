class AwardsController < ApplicationController

  add_breadcrumb "Index for Awards", :awards_index_path, only: [:index, :new, :create, :destroy, :edit,:update]
  before_action :authenticate_admin!, only: [:index, :new, :create, :destroy, :edit,:update]

  def view
	@name = @title = "School's Awards"
	@awards = Array.new
	Award.all.each do |award|
		@awards << {:name => "#{award.title}",:value => "/award/#{award.id}/", :time => award.date}
	end
  end

  def new
  	@award=Award.new

    add_breadcrumb 'New', new_award_path
  	
  end

  def index
    @awards=Award.all
    
  end

  def create
    @award=Award.new(award_params)
    @award.date=Date.new params[:award]['date(1i)'].to_i, params[:award]['date(2i)'].to_i, params[:award]['date(3i)'].to_i
    if @award.save
      flash_notice_create 'Award'
      redirect_to awards_index_path
    else
      render 'new'
    end
  end

  def edit
    @award=Award.find params[:id]

    add_breadcrumb 'Edit', edit_award_path(@award)
  end

  def update
    @award=Award.find params[:id]
    @award.title=params[:award][:title]
    @award.description=params[:award][:description]
    @award.date=Date.new params[:award]['date(1i)'].to_i, params[:award]['date(2i)'].to_i, params[:award]['date(3i)'].to_i
    if @award.save
      flash_notice_edit 'Award'
      redirect_to awards_index_path
    else
      render 'edit'
    end    
  end

  def destroy
    @award=Award.find params[:id]
    if @award.destroy
      flash_notice_destroy 'Award'
    end
    redirect_to awards_index_path    
    
  end

  private
    def award_params
            params.require(:award).permit(:title, :description)
    end


end
