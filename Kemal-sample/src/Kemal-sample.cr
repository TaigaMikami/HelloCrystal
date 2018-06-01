require "kemal"

# http://localhost:3000/ または
# http://localhost:3000/articles/ のどちらでもアクセスできるようにする
["/", "/articles"].each do |path|
  get path do |env|
    articles = [
      {"id" => 1, "title" => "title1", "body" => "body1"},
      {"id" => 2, "title" => "title2", "body" => "body2"},
      {"id" => 3, "title" => "title3", "body" => "body3"},
    ]

    render "src/views/index.ecr", "src/views/application.ecr"
  end
end

Kemal.run
