# frozen_string_literal: true

class Api::V1::Slack::MessagesController < Api::V1::ApplicationController
  skip_before_action :logged_in_user

  def index
    render json: 'ok'
  end

  def create
    Rails.logger.info "Starting callback"
    case params['type']
    when 'url_verification'
      Rails.logger.info "Return ok"
      render json: @body
    end
  end
end