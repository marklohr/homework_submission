class AddFirstnameAndLastnameAndGithubNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :github_account, :string
  end
end
