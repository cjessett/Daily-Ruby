class CreateRubyClasses < ActiveRecord::Migration
  def change
    create_table :ruby_classes do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
