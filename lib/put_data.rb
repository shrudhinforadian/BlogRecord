
class PutData
  def self.put(req)
    path, id = Find.find_path_and_id(req.fullpath)
    case path
    when 'posts/id'
      params = JSON.parse(req.body.read)
      if !Post.find_by(id: id).nil? && Post.find_by(id: params['id']).nil?
        post = Post.find_by(id: id)
        post.update(id: params['id'], userid: params['userid'],
           title: params['title'], body: params['body'])
        [201, { 'Content-Type' => 'text/json/html' },
           ['Post Updated/Replaced Successfully']]
      else
        [404, { 'Content-Type' => 'text/json/html' },
           [id.to_s, ' Cannot be Updated/Replaced']]
      end
    when 'comments/id'
      params = JSON.parse(req.body.read)
      if !Comment.find_by(id: id).nil? && Comment.find_by(id: params['id']).nil?
        comment = Comment.find_by(id: id)
        comment.update(id: params['id'], postid: params['postid'],
          name: params['name'], email: params['email'], body: params['body'])
        [201, { 'Content-Type' => 'text/json/html' },
           ['Comment Updated/Replaced Successfully']]
      else
        [404, { 'Content-Type' => 'text/json/html' }, [id.to_s,
          ' Cannot be Updated/Replaced']]
      end
    when 'users/id'
      params = JSON.parse(req.body.read)
      if !User.find_by(id: id).nil? && User.find_by(id: params['id']).nil?
        user = User.find_by(id: id)
        user.update(id: params['id'], name: params['name'],
           username: params['username'], email: params['email'], address: params['address'])
        [201, { 'Content-Type' => 'text/json/html' },
           ['User Updated/Replaced Successfully']]
      else
        [404, { 'Content-Type' => 'text/json/html' },
           [id.to_s, ' Cannot be Updated/Replaced']]
      end
    else
      [404, { 'Content-Type' => 'text/html' },
         ["<h1 align='center'>Error 404 not found </h1>"]]
    end
  end
end
