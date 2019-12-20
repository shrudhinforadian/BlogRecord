class PatchData
  def self.patch(req)
    path, id = Find.find_path_and_id(req.fullpath)
    case path
    when 'posts/id'
      params = JSON.parse(req.body.read)

      if !Post.find_by(id: id).nil?
        post = Post.find_by(id: id)
        post.update(userid: params['userid'],
           title: params['title'], body: params['body'])
        [201, { 'Content-Type' => 'text/json/html' },
          ['Post updated Successfully']]
      else
        [404, { 'Content-Type' => 'text/json/html' },
           [id.to_s, ' Cannot be updated']]
      end
    when 'comments/id'
      params = JSON.parse(req.body.read)
      if !Comment.find_by(id: id).nil?
        comment = Comment.find_by(id: id)
        comment.update(postid: params['postid'], name: params['name'],
           email: params['email'], body: params['body'])
        [201, { 'Content-Type' => 'text/json/html' },
           ['Comment updated Successfully']]
      else
        [404, { 'Content-Type' => 'text/json/html' },
          [id.to_s, ' Cannot be updated']]
      end
    when 'users/id'
      params = JSON.parse(req.body.read)
      if !User.find_by(id: id).nil?
        user = User.find_by(id: id)
        user.update(name: params['name'], username: params['username'],
          email: params['email'], address: params['address'])
        [201, { 'Content-Type' => 'text/json/html' }, ['User updated Successfully']]
      else
        [404, { 'Content-Type' => 'text/json/html' },
          [id.to_s, ' Cannot be updated']]
      end
    else
      [404, { 'Content-Type' => 'text/html' },
        ["<h1 align='center'>Error 404 not found </h1>"]]
    end
  end
end
