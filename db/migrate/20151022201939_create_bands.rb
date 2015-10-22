class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :band_name, presence: true, unique: true, index: true

      t.timestamps
    end
  end
end
