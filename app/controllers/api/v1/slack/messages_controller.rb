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
    when 'event_callback'
      Slack.chat_postMessage(
        as_user: 'true',
        channel: params[:event]['channel'],
        text: params[:event]['text']
      )
      render status: 200, json: { challenge: params[:challenge] }
    end
  end
end