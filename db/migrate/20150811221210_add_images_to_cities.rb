class AddImagesToCities < ActiveRecord::Migration
  change_table :cities do |t|
    t.string :image
  end
end
