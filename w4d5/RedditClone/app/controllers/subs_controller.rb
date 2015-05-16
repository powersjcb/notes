class SubsController < ApplicationController

  def index
    @subs = Sub.all
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user_id

    if @sub.save
      redirect_to @sub
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def new
    @sub = Sub.new
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.nil?
      could_not_find_error
      redirect_to subs_url
    elsif @sub.save
      redirect_to @sub
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    @sub = Sub.find(params[:id])
    @posts = @sub.posts
  end

  protected

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
