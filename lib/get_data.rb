
class GetData
  require_relative './find_path'
  def self.get(req)
    path, id = Find.find_path_and_id(req.fullpath)
    case path
    when 'posts'
      [200, { 'Content-Type' => 'text/json/html' }, [Post.all.to_json.to_s]]
    when 'comments'
      [200, { 'Content-Type' => 'text/json/html' }, [Comment.all.to_json.to_s]]
    when 'users'
      [200, { 'Content-Type' => 'text/json/html' }, [User.all.to_json.to_s]]
    when 'posts/id'
      [200, { 'Content-Type' => 'text/json/html' }, [Post.find_by(id: id).to_json.to_s]]
    when 'comments/id'
      [200, { 'Content-Type' => 'text/json/html' }, [Comment.find_by(id: id).to_json.to_s]]
    when 'posts/comments'
      [200, { 'Content-Type' => 'text/json/html' }, [Comment.find_all.to_json.to_s]]
    when 'comments?postid'
      [200, { 'Content-Type' => 'text/json/html' }, [Comment.find_by(postid: id).to_json.to_s]]
    when 'posts?userid'
      [200, { 'Content-Type' => 'text/json/html' }, [Post.find_by(userid: id).to_json.to_s]]
    when 'users/id'
      [200, { 'Content-Type' => 'text/json/html' }, [Users.find_by(id: id).to_json.to_s]]
    # [500, {"Content-Type" => "text/html"}, ["Goodbye Cruel World!"]]
    else
      [404, { 'Content-Type' => 'text/html' }, ["<h1 align='center'>Error 404 not found </h1>"]]
    end
  end
end
