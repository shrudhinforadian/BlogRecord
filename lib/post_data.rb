class PostData
  def self.post(req)
    path, id = Find.find_path_and_id(req.fullpath)
    case path
    when 'posts'
      params = JSON.parse(req.body.read)

      if Post.find_by(id: params["id"]).nil?
        Post.create(:id => params["id"] ,:userid =>  params["userid"],:title =>params["title"],:body =>params["body"] )
        [201, { 'Content-Type' => 'text/json/html' }, ["Post inserted Successfully"]]
      else
        [404, { 'Content-Type' => 'text/json/html' }, [params["id"].to_s," Cannot be Inserted"]]
      end
    when 'comments'
      params = JSON.parse(req.body.read)
      if Comment.find_by(id: params["id"]).nil?
        Comment.create(:id => params["id"] ,:postid =>  params["postid"],:name =>params["name"],:email =>params["email"],:body =>params["body"] )
        [201, { 'Content-Type' => 'text/json/html' }, ["Comment inserted Successfully"]]
      else
        [404, { 'Content-Type' => 'text/json/html' }, [params["id"].to_s," Cannot be Inserted"]]
      end
    when 'users'
      params = JSON.parse(req.body.read)
      if User.find_by(id: params["id"]).nil?
        User.create(:id => params["id"] ,:name =>  params["name"],:username =>params["username"],:email =>params["email"],:address =>params["address"] )
        [201, { 'Content-Type' => 'text/json/html' }, ["User inserted Successfully"]]
      else
        [404, { 'Content-Type' => 'text/json/html' }, [params["id"].to_s," Cannot be Inserted"]]
      end
    else
      [404, { 'Content-Type' => 'text/html' }, ["<h1 align='center'>Error 404 not found </h1>"]]
    end
  end
end
