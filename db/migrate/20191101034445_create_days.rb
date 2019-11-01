class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.belongs_to :user, index: true

      t.integer :quality
      t.boolean :different
      t.boolean :exercised
      t.boolean :ill
      t.text :description

      t.timestamps
    end
  end
end
