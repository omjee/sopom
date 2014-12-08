class CreateProfils < ActiveRecord::Migration
  def change
    create_table :profils do |t|
      t.string :prenom
      t.string :sexe
      t.string :age
      t.string :phone
      t.string :address
      t.string :website
      t.string :codePostal
      t.string :ville

      t.timestamps
    end
  end
end
