Sequel.migration do
  change do
    create_table? :posts do
      primary_key :id
      foreign_key :user_id, :users, null: false, on_delete: :cascade #deleta o post se o usuário também for deletado
      String :title, null: false
      String :content
    end
  end
end