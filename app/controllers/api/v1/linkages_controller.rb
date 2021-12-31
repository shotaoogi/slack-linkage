# frozen_string_literal: true

class Api::V1::LinkagesController < Api::V1::ApplicationController
  def create
    token = current_organization.linkages.new(linkage_params)
    if token.save
      render json: { status: :created, token: token}
    else
      render json: { status: 500 }
    end
  end

  private

  def linkage_params
    params.require(:linkage).permit(:name, :token)
  end
end