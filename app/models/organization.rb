# frozen_string_literal: true

class Organization < ApplicationRecord
  belongs_to :organization_user
end
