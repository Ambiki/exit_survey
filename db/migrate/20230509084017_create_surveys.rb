class CreateSurveys < ActiveRecord::Migration[7.0]
  def change
    create_table :surveys do |t|
      t.belongs_to :user, null: false, foreign_key: true

      t.string :competitor_url, null: false
      t.text :description
      t.string :reason, null: false

      t.timestamps
    end
  end
end
