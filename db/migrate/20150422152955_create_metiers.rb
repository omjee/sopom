class CreateMetiers < ActiveRecord::Migration
  def change
    create_table :metiers do |t|
      t.string :name

      t.timestamps
    end
  end
end
