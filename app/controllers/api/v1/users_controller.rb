# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: { logged_in: true, user: user.to_hash }
    else
      render json: { logged_in: false, errors: 'ユーザーの作成に失敗しました。' }
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :organization )
  end
end
