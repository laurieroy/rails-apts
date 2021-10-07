class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :heading
      t.text :body
      t.decimal :price
      t.string :neighborhood
      t.string :external_url

      t.timestamps
    end
  end
end
