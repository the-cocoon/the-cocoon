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

  JODY
  JODY
  git@github.com:the-cocoon/JODY.git
  master

  jsvoid
  jsvoid
  git@github.com:the-cocoon/jsvoid.git
  master

  log_js
  log_js
  git@github.com:the-cocoon/log_js.git
  master

  pagination
  pagination
  git@github.com:the-cocoon/pagination.git
  master

  simple_sort
  simple_sort
  git@github.com:the-cocoon/simple_sort
  master

  notifications
  notifications
  git@github.com:the-cocoon/notifications
  master

  voiceless
  voiceless
  git@github.com:the-cocoon/voiceless
  master

  has_meta_data
  has_meta_data
  git@github.com:the-cocoon/has_meta_data.git
  master

  to_slug_param
  to_slug_param
  git@github.com:the-cocoon/to_slug_param.git
  master

  friendly_id_pack
  friendly_id_pack
  git@github.com:the-cocoon/friendly_id_pack.git
  master

  the_string_addon
  the_string_addon
  git@github.com:the-cocoon/the_string_addon.git
  master

  image_tools
  image_tools
  git@github.com:the-cocoon/image_tools.git
  master

  crop_tool
  crop_tool
  git@github.com:the-cocoon/crop_tool.git
  master

  attached_images
  attached_images
  git@github.com:the-cocoon/attached_images.git
  master

  the_storages
  the_storages
  git@github.com:the-cocoon/the_storages.git
  master

  role_slim_js
  role_slim_js
  git@github.com:the-cocoon/role_slim_js.git
  master

  components
  components
  git@github.com:the-cocoon/components.git
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
