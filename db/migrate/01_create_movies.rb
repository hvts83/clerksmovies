class CreateMovies < ActiveRecordL::Migration[5.2]
    def change
        create_table :movies do |t|
            t.string    :name
            t.integer   :year
            t.integer   :copies
        end
    end
end