class SubsController < ApplicationController
  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new
    if current_user.nil?
      redirect_to new_session_url
    end
  end

  def create
    sub = Sub.new(sub_params)
    sub.mod_id = current_user.id

    if sub.save
      redirect_to sub_url(sub)
    else
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    if current_user.id == @sub.mod_id
      render :edit
    else
      redirect_to subs_url
    end
  end

  def update
    sub = Sub.find(params[:id])

    if current_user.id == sub.mod_id
      if sub.update(sub_params)
        redirect_to sub_url(sub)
      else
        render :edit
      end
    else
      redirect_to sub_url(sub)
    end
  end

  def destroy
    sub = Sub.find(params[:id])
    if current_user.id == sub.mod_id
      sub.destroy
    end
    redirect_to subs_url
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :mod_id, :description)
  end
end
