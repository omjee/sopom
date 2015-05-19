class AddJobIdToProfils < ActiveRecord::Migration
  def change
    add_column :profils, :job_id, :integer
  end
end
