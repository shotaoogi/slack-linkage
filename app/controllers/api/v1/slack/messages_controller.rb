# frozen_string_literal: true

class Api::V1::Slack::MessagesController < Api::V1::ApplicationController
  skip_before_action :logged_in_user

  def index
    render json: 'ok'
  end

  def receive
    case params[:type]
    when 'url_verification'
      Rails.logger.info "Sending challenge to Slack"
    render status: 200, json: { challenge: params[:challenge] }
    end
    Rails.logger.info "Sending shortcut modal"
    response = Slack::Events::Request.new(params)
    render status: 200, json: { body: response.body}
  end
end