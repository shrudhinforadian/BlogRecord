
class Find
  def self.find_path_and_id(path_info)
    case path_info
    when %r{posts/(\d+)$}
      id = path_info.scan(%r{posts/(\d+)$})
      return 'posts/id', id[0][0]
    when /users$/
      return 'users', nil
    when %r{^/comments$}
      return 'comments', nil
    when %r{posts/\d+/comments$}
      id = path_info.scan(%r{posts/(\d+)/comments$})
      return 'post/comments', id[0][0]
    when /comments\?postId=\d+$/
      id = path_info.scan(/comments\?postId=(\d+)$/)
      return 'comments?postid', id[0][0]
    when /posts(\?)userid=(\d+)$/
      id = path_info.scan(/posts\?userid=(\d+)$/)
      return 'posts?userid', id[0][0]
    when /posts$/
      return 'posts', nil
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
end
