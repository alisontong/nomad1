class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.string :title
      t.string :description

      t.belongs_to :user

      t.timestamps :integer
    end
  end
end
