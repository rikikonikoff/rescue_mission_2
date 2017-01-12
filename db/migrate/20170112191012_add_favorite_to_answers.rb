class AddFavoriteToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :favorite, :boolean, default: false
  end
end
