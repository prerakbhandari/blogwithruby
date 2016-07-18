json.array!(@tests) do |test|
  json.extract! test, :id, :name, :title, :content
  json.url test_url(test, format: :json)
end
