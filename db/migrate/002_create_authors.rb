class CreateAuthors < ActiveRecord::Migration

  def change

    create_table :authors do |t|
      t.string :name
      #add books if needed
    end

  end

end
