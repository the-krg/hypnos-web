class CreateNights < ActiveRecord::Migration[6.0]
  def change
    create_table :nights do |t|
      t.belongs_to :user, index: true

      t.datetime :sleep_hour
      t.datetime :wake_hour
      t.integer :quality
      t.integer :ill
      t.text :description
      t.text :dream

      t.timestamps
    end
  end
end
