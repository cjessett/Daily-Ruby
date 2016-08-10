class CreateRubyMethods < ActiveRecord::Migration
  def change
    create_table :ruby_methods do |t|
      t.string :name
      t.string :link
      t.integer :ruby_class_id

      t.timestamps null: false
    end
  end
end
