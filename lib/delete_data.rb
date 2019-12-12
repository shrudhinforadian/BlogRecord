class DeleteData
  def self.delete(req)
    path, id = Find.find_path_and_id(req.fullpath)
    params = JSON.parse(req.body.read)
    case path
    when 'posts/id'
      post=Post.find_by(id: id)
      if post.nil?
        [404, { 'Content-Type' => 'text/json/html' }, [id.to_s," Not Found"]]
      else
        post.destroy
        [200, { 'Content-Type' => 'text/json/html' }, [id.to_s,"Deleted Successfully"]]
      end
    when 'users/id'
      user=User.find_by(id: id)
      if user.nil?
        [404, { 'Content-Type' => 'text/json/html' }, [id.to_s," Not Found"]]
      else
        user.destroy
        [200, { 'Content-Type' => 'text/json/html' }, [id.to_s,"Deleted Successfully"]]
      end
    when 'comments/id'
      comment=Comment.find_by(id: id)
      if comment.nil?
        [404, { 'Content-Type' => 'text/json/html' }, [id.to_s," Not Found"]]
      else
        comment.destroy
        [200, { 'Content-Type' => 'text/json/html' }, [id.to_s,"Deleted Successfully"]]
      end
    else
      [404, { 'Content-Type' => 'text/html' }, ["<h1 align='center'>Error 404 not found </h1>"]]
    end
  end
end
