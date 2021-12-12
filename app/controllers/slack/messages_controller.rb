# frozen_string_literal: true

class Slack::MessagesController < ApplicationController
  def create
    @body = JSON.parse(request.body.read)
    case @body['type']
    when 'url_verification'
      render json: @body
    end
  end
end