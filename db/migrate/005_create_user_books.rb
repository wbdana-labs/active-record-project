class CreateUserBooks < ActiveRecord::Migration

  def change

    create_table :user_books, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :books, index: true
    end

    # create_table :assemblies_parts, id: false do |t|
    #   t.belongs_to :assembly, index: true
    #   t.belongs_to :part, index: true
    # end
    
  end

end
