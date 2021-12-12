# frozen_string_literal: true

class Api::V1::ApplicationController < ActionController::API
  config.api_only = true
  include SessionsHelper
  before_action :logged_in_user

  private

  # ユーザーのログインを確認する
  def logged_in_user
    return if logged_in?

    store_location
    render json: { logged_in: false, errors: %w[ログインしてください] }
  end
end
