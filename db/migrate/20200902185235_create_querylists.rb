class CreateQuerylists < ActiveRecord::Migration[5.0]
  def change
    create_table :querylists do |t|
      t.string :emailaddres
      t.string :query

      t.timestamps
    end
  end
end
