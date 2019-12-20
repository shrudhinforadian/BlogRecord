
require './db_connect'
require './lib/posts'
require './lib/comments'
require './lib/users'
require './lib/get_data'
require './lib/post_data'
require './lib/delete_data'
require './lib/put_data'
require './lib/patch_data'
require './lib/find_path'

class Main
  def call(env)
    req = Rack::Request.new(env)
    case req.request_method
    when 'GET'
      GetData.get(req)
    when 'POST'
      PostData.post(req)
    when 'PUT'
      PutData.put(req)
    when 'PATCH'
      PatchData.patch(req)
    when 'DELETE'
      DeleteData.delete(req)
    else
      [404, { 'Content-Type' => 'text/html' },
        ["<h1 align='center'>Error 404 not found </h1>"]]
    end
  end
end
