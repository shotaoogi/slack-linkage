# frozen_string_literal: true

class Api::V1::SessionsController < Api::V1::ApplicationController
  skip_before_action :logged_in_user, only: %i[create]

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      log_in(user)
      render json: { logged_in: true, user: user.to_hash }
    else
      render json: { logged_in: false, errors: %w[認証に失敗しました。 正しいメールアドレス・パスワードを入力し直すか、新規登録を行ってください。] }
    end
  end

  def destroy
    reset_session if logged_in?
    render json: { status: 'success', logged_out: true }
  end

  def logged_in?
    if @current_user
      render json: { logged_in: true, user: current_user }
    else
      render json: { logged_in: false, message: 'ユーザーが存在しません' }
    end
  end

  private

  def session_params
    params.require(:user).permit(:username, :email, :password)
  end
end
