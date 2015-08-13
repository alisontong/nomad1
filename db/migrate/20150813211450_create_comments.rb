class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

      t.string :description

      t.belongs_to :user
      t.belongs_to :post
      t.timestamps null: false
    end
  end
end
