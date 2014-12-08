class AddProfilIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :profil_id, :integer
  end
end
