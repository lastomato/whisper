class EntriesController < ApplicationController
  before_filter :require_login, :except => [:show, :search, :index, :feed]

  def index
    @entries = Entry.all
    @date = (params[:year] || params[:month]) ? Date.parse(params[:year] || params[:month]) : Date.today

    @blog = 1
  end

  def new
    @entry = Entry.new
  end

  def show
    @entry = Entry.find_by_permalink(params[:permalink])

    @prev = Entry.only(:permalink, :created_at).where(:created_at.lt => @entry.created_at).asc(:created_at).last
    @next = Entry.only(:permalink, :created_at).where(:created_at.gt => @entry.created_at).asc(:created_at).first
  end

  def edit
    @entry = Entry.find_by_permalink(params[:permalink])
  end

  def create
    @entry = current_user.entries.create(params[:entry])

    if @entry.save
      redirect_to entry_show_path(@entry.permalink), :notice => "Successfully created!"
    else
      flash[:alert] = "Fail"
    end
  end

  def update
    @entry = Entry.find_by_permalink(params[:permalink])
    @entry.update_attributes(params[:entry])

    if @entry.save
      redirect_to entry_show_path(@entry.permalink), :notice => "Successfully created!"
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

  def feed
    @entries = Entry.all

    respond_to do |format|
      format.atom
    end
  end
end
