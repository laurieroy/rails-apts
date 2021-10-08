class CreatePost < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :heading
      t.datetime :time_listed
      t.string :hood
      t.string :ext_link
      t.decimal :price

      t.timestamps
    end
  end
end
