SUBS = %w[
  USER_ROOM
  USER_ROOM
  git@github.com:the-cocoon/USER_ROOM.git
  master

  RAILS_BLOG
  RAILS_BLOG
  git@github.com:the-cocoon/RAILS_BLOG.git
  master

  RAILS_SHOP
  RAILS_SHOP
  git@github.com:the-cocoon/RAILS_SHOP.git
  master

  db_bootstrap
  db_bootstrap
  git@github.com:the-cocoon/db_bootstrap.git
  master
].each_slice(4)

def submodule_add(name, path, repo, branch)
  puts cmd = "git submodule add -b #{branch} #{repo} #{ path }"
  puts `#{ cmd }`
end

def submodule_rm(name, path, repo, branch)
  puts cmd = "git submodule deinit #{ name }"
  puts `#{ cmd }`

  puts cmd = "git rm --cached #{ path }"
  puts `#{ cmd }`

  puts cmd = "rm -rf /modules/#{ path }"
  puts `#{ cmd }`

  puts cmd = "rm -rf #{ path }"
  puts `#{ cmd }`
end

def submodules_init
  puts cmd = "git submodule init"
  puts `#{ cmd }`
end

def submodules_update
  puts cmd = "git submodule update"
  puts `#{ cmd }`
end

def add_submodules
  SUBS.each do |sub|
    name   = sub[0]
    path   = sub[1]
    repo   = sub[2]
    branch = sub[3]

    submodule_add(name, path, repo, branch)
  end
end

def rm_submodules
  SUBS.each do |sub|
    name   = sub[0]
    path   = sub[1]
    repo   = sub[2]
    branch = sub[3]

    submodule_rm(name, path, repo, branch)
  end

  puts cmd = "git reset --hard"
  puts `#{ cmd }`
end

add_submodules
submodules_init
submodules_update
# rm_submodules
