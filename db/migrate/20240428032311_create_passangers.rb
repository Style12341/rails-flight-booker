class CreatePassangers < ActiveRecord::Migration[7.1]
  def change
    create_table :passangers do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
    add_reference :passangers, :booking, foreign_key: true
  end
end
