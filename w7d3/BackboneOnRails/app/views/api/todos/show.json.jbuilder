json.todo do
  json.extract!(@todo, :id, :content, :created_at, :updated_at)
  json.array!(@comments partial: "comments/comment", as: :comment)
end
