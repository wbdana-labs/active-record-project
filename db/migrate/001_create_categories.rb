class CreateCategories < ActiveRecord::Migration

  def change

    create_table :categories do |t|
      t.string :name
      #add books if needed
    end

  end

end
