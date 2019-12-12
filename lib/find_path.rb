class Find
  def self.find_path_and_id(path_info)
    # path_info = path_info.chomp('/') if path_info[-1] == '/'
    p path_info
    case path_info
    when %r{posts/(\d+)$}
      id = path_info.scan(%r{posts/(\d+)$})
      # p 'posts/id', id[0][0]
      return 'posts/id', id[0][0]
    when %r{users$}
      return 'users', nil
    when %r{^/comments$}
      return 'comments', nil
    when %r{posts/\d+/comments$}
      id = path_info.scan(%r{posts/(\d+)/comments$})
      return 'post/comments', id[0][0]
    when %r{comments\?postId=\d+$}
      id = path_info.scan(/comments\?postId=(\d+)$/)
      return 'comments?postid', id[0][0]
    when %r{posts(\?)userid=(\d+)$}
      id = path_info.scan(/posts\?userid=(\d+)$/)
      # p 'hi'
      # p id[0][0]
      return 'posts?userid', id[0][0]
    when /posts$/
      # p 'posts', nil
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
