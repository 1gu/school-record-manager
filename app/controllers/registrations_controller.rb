class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @schools = School.all
  end

  def school
    @school = School.find(params[:id])
  end

  def klass
    @klass = Klass.find(params[:id])
  end

  def authenticate
    klass = Klass.find(params[:id])

    if klass.authenticate(params[:password])
      current_user.save_klass!(klass)
      flash[:notice] = '認証しました。'
      redirect_to home_path
    else
      flash[:alert] = 'パスワードが間違っています。'
      redirect_to registrations_klass_path(params[:id])
    end
  end
end
