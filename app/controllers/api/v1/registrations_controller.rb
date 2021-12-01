# frozen_string_literal: true

class Api::V1::RegistrationsController < Api::V1::ApplicationController
  skip_before_action :logged_in_user, only: %i[signup]

  def signup
    user = User.new(registrations_params)

    if user.save
      log_in(user)
      render json: { status: :created, user: user.to_hash }
    else
      render json: { status: 500 }
    end
  end

  private

  def registrations_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
