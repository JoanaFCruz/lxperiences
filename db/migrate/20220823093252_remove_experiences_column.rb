class RemoveExperiencesColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column(:experiences, :user_id)
  end
end
