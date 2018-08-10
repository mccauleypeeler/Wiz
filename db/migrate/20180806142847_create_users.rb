class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :number
      t.boolean :event_status, default: false
      t.string :event_time
      t.boolean :claim_status, default: false

      t.timestamps
    end
  end
end
