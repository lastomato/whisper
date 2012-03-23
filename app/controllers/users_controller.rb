class UsersController < ApplicationController
  def new

  end

  def invite
    invite_code = InviteCode.where(:code => params[:invite_code]).first

    if invite_code
      #redirect_to new_path(params[:invite_code])
    end
  end

  def create

  end

  def destroy

  end
end
