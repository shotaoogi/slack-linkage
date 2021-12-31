# frozen_string_literal: true

class Organization < ApplicationRecord
  has_many :organization_users
  has_many :users, through: :organization_users, dependent: :destroy
  has_many :linkages, dependent: :destroy
end
