# frozen_string_literal: true

class CreateLinkages < ActiveRecord::Migration[6.1]
  def change
    create_table :linkages do |t|
      t.string :name, null: false
      t.string :token, null: false
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
