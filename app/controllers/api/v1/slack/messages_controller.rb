# frozen_string_literal: true

class Api::V1::Slack::MessagesController < Api::V1::ApplicationController
  skip_before_action :logged_in_user

  def index
    render json: 'ok'
  end

  def receive
    payload = JSON.parse(params[:payload])
    case payload['type']
    when 'shortcut'
      client.views_open(trigger_id: payload['trigger_id'], view: build_initial_view)
    when 'view_submission'
      client.chat_postMessage(text: 'ok', channel: 'general')
    end
  end

  private

  def client
    @client ||= Slack::Web::Client.new
  end

  def build_initial_view
    {
      "type": "modal",
      "title": {
        "type": "plain_text",
        "text": "My App",
        "emoji": true
      },
      "submit": {
        "type": "plain_text",
        "text": "Submit",
        "emoji": true
      },
      "close": {
        "type": "plain_text",
        "text": "Cancel",
        "emoji": true
      },
      "blocks": [
        {
          "type": "input",
          "block_id": "select_user",
          "element": {
            "type": "static_select",
            "action_id": "selected_user",
            "placeholder": {
              "type": "plain_text",
              "text": "Select a user",
              "emoji": true
            },
            "options": [
              {
                "text": {
                  "type": "plain_text",
                  "text": "AAA",
                  "emoji": true
                },
                "value": "selected_aaa"
              },
              {
                "text": {
                  "type": "plain_text",
                  "text": "BBB",
                  "emoji": true
                },
                "value": "selected_bbb"
              }
            ]
          },
          "label": {
            "type": "plain_text",
            "text": "Label",
            "emoji": true
          }
        }
      ]
    }
  end
end