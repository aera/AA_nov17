class AddIsAdminToUser < ActiveRecord::Migration[5.1]
  def change
    # You can set defaults on columns at the db level by specifying
    # the option `default: <value>`. You can also do this
    # when defining columns inside of a `create_table` method.
    add_column :users, :is_admin, :boolean, default: false

    # For columns that are booleans, ActiveRecord provides an alternate
    # method to read it. This method will be the column with `?` at the end.
    # In this case, we'd be able to do `user.is_admin?` or `user.is_admin`
  end
end
