require "./kemal-todo/*"
require "kemal"
# 注記
# 本サンプルではkemal-pgを直接requireしない
# https://github.com/sdogruyol/kemal-pg/issues/1
require "pg"
require "pool/connection"

module Kemal::Todo
pg = ConnectionPool.new(capacity: 25, timeout: 0.1) do
  PG.connect("postgres://postgres@localhost:5432/articles")
end

get "/" do |env|
  conn = pg.connection
  # クエリの実行
  result = conn.exec("select id, title, body from articles")
  pg.release
  # ハッシュへの変換
  articles = result.to_h
  render "src/views/index.ecr", "src/views/application.ecr"
end


get "/articles/new" do |env|
  render "src/views/articles/new.ecr", "src/views/application.ecr"
end

post "/articles" do |env|
  # env.params.bodyでformのvalue:wqを取得できます
  title_param = env.params.body["title"]
  body_param = env.params.body["body"]
  params = [] of String
  params << title_param
  params << body_param
  conn = pg.connection
  conn.exec("insert into articles(title, body) values($1::text, $2::text)", params)
  pg.release
  env.redirect "/"
end

get "/articles/:id" do |env|
  id = env.params.url["id"].to_i32
  params = [] of Int32
  params << id
  conn = pg.connection
  result = conn.exec({Int32, String, String}, "select id, title, body from articles where id = $1::int8", params)
  pg.release
  articles = result.to_hash
  render "src/views/articles/show.ecr", "src/views/application.ecr"
end

Kemal.run

end
