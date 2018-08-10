class CreateButtons < ActiveRecord::Migration[5.2]
  def change
    create_table :buttons do |t|
      t.boolean :status

      t.timestamps
    end
  end
end
