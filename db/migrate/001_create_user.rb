Sequel.migration do
  change do
    create_table? :users do
      primary_key :id
      String :name, unique: true
      String :email, unique: true
      String :password
    end
  end
end