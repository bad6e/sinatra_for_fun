class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.text :description
      t.string :submitter_email

      t.timestamps
    end
    add_index :posts, :url, unique: true
  end
end
