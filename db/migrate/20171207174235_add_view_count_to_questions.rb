class AddViewCountToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :view_count, :integer
    # For most migration methods such as `add_column` above,
    # the arguments are in the following order:
    # - The first is the name of the table which is lower case and
    #   plural
    # - The second is the name of the column that is being changed
    #   or created
    # - The third is the type of the column
  end
end
