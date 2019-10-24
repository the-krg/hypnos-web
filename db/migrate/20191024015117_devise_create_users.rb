# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      # Login factors

      t.string   :username, null: false, default: ""
      t.string   :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      # Characteristics
      t.datetime :birthdate
      t.integer :height
      t.integer :weight
      t.string :scholarity
      t.string :profession
      t.string :transportation
      t.string :neighborhood
      t.boolean :smoker, default: false
      t.boolean :take_meds, default: false

      t.timestamps null: false
    end

    add_index :users, :username,             unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
