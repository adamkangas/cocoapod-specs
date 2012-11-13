Pod::Spec.new do |s|
  s.name     = 'liblua'
  s.version  = '5.1.4'
  s.license  = 'MIT'
  s.summary  = 'Lua library for inclusion in iOS apps.'
  s.homepage = 'http://EXAMPLE/lua'
  s.author   = { 'Adam Kangas' => 'adamkangas@gmail.com' }
  s.source   = { :git => 'https://github.com/LuaDist/lua.git', :tag => '5.1.4' }
  s.description = 'An optional longer description of lua.'
  s.source_files = 'src/*.{c,h,rc,h.in,h.orig}'

  def s.post_install(target)
    lua_pbxgroup = target.project.groups.select {|g| g.name == "liblua" }.first
    raise "Couldn't find liblua PBXGroup" unless lua_pbxgroup

    src_dir = "#{config.project_pods_root}/liblua/src"
    headers_dir = "#{config.project_pods_root}/Headers/liblua"

    FileUtils.cp "#{src_dir}/luaconf.h.orig", "#{src_dir}/luaconf.h"
    lua_pbxgroup.files.new('path' => "#{src_dir}/luaconf.h")

    %w(loadlib_rel.c lua.c luac.c).each do |filename|
      FileUtils.rm "#{src_dir}/#{filename}"
      lua_pbxgroup.files.select {|f| f.name == filename }.each {|f| target.project.objects_hash.delete(f.uuid) }
#    target.project.pods.files.where(:name => "loadlib_rel.c").destroy
    end

    FileUtils.ln_s "#{src_dir}/luaconf.h", "#{headers_dir}/luaconf.h"
  end
end
