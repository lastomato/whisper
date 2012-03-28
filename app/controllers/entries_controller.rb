class EntriesController < ApplicationController
  before_filter :logged_in?, :except => [:show, :search, :index]

  def index
    @entries = Entry.all.page(params[:page])
  end

  def new
    @entry = Entry.new
  end

  def show
    @entry = Entry.find_by_permalink(params[:permalink])
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.update_attributes(params[:entry])

    if @entry.save
      redirect_to show_path(@entry.permalink), :notice => "Successfully created!"
    else
      flash[:alert] = "Fail"
    end
  end

  def update
    @entry = Entry.create(params[:entry])

    if @entry.save
      redirect_to show_path(@entry.permalink), :notice => "Successfully created!"
    else
      flash[:alert] = "Fail"
    end
  end

  def destroy
    @entry = Entry.find(params[:id])

    if @entry.destroy
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js { render "shared/fail_to_destroy" }
      end
    end
  end

  def search
    @entries = Entry.search(params[:keyword])
  end
end
