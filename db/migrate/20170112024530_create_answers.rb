class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :body, null: false, length: { minimum: 50 }
      t.belongs_to :question
      t.belongs_to :user

      t.timestamps
    end
  end
end
