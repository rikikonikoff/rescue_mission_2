class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false, length: { minimum: 50 }
      t.text :description, null: false, length: { minimum: 150 }
      t.belongs_to :asker, class: :User

      t.timestamps
    end
  end
end
