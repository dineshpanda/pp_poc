class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.string :state
      t.string :city
      t.string :country
      t.string :zipcode
      t.st_point :lonlat
    end
    add_index :properties, :lonlat, using: :gist
  end
end
