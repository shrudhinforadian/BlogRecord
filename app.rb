
require './db_connect'
require './lib/posts'
require './lib/comments'
require './lib/users'
class Main
  def call(env)
    req = Rack::Request.new(env)
    path, id = find_path_and_id(req.path_info)
    # p req
    case req.request_method
    when 'GET'
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
    when 'POST'
      [201, { 'Content-Type' => 'text/json/html' }, [Post.create(:id => contact[:name] ,:userid =>  contact[:number],:title =>contact[:email],:body =>contact[:email] )]]
    when 'PUT'

    when 'PATCH'

    when 'DELETE'
      post=Post.find_by(id: id)
      post.destroy

    end
  end

  def find_path_and_id(path_info)
    path_info = path_info.chomp('/') if path_info[-1] == '/'
    case path_info
    when %r{posts$}
      return 'posts', nil
    when %r{posts/(\d+)$}
      id = path_info.scan(%r{posts/(\d+)$})
      return 'posts/id', id[0][0]
    when %r{users$}
      return 'users', nil
    when %r{^/comments$}
      return 'comments', nil
    when %r{posts/\d+/comments$}
      id = path_info.scan(%r{posts/(\d+)/comments$})
      return 'post/comments', id[0][0]
    when /comments\?postId=\d+$/
      id = path_info.scan(/comments\?postId=(\d+)$/)
      return 'comments?postid', id[0][0]
    when %r{posts\?userID=\d+$}
      id = path_info.scan(/posts\?userID=(\d+)$/)
      return 'posts?userid', id[0][0]
    when %r{users/(\d+)$}
      id = path_info.scan(%r{users/(\d+)$})
      return 'users/id', id[0][0]
    when %r{comments/(\d+)$}
      id = path_info.scan(%r{comments/(\d+)$})
      return 'comments/id', id[0][0]
    else
      return false, nil
    end
  end
  p 'hello world'
end
