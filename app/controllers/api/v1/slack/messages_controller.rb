# frozen_string_literal: true

class Api::V1::Slack::MessagesController < Api::V1::ApplicationController
  skip_before_action :logged_in_user

  def index
    render json: 'ok'
  end

  def create
    @body = JSON.parse(request.body.read)
    case @body['type']
    when 'url_verification'
      render json: @body
    end
  end
end