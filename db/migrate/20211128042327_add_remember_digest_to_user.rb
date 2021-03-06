# frozen_string_literal: true

class AddRememberDigestToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :remember_digest, :string
  end
end
