namespace :package do
  desc "Update the version in #{@version_file} to current and commit."
  task :versionbump  do
    old_version =  get_version_file_version
    contents = IO.read(@version_file)
    new_version = '"' + @version.to_s.strip + '"'
    if contents.match("@DEVELOPMENT_VERSION@")
      contents.gsub!("@DEVELOPMENT_VERSION@", @version.to_s.strip)
    elsif contents.match("VERSION = #{old_version}")
      contents.gsub!("VERSION = #{old_version}", "VERSION = #{new_version}")
    elsif contents.match("#{@name.upcase}VERSION = #{old_version}")
      contents.gsub!("#{@name.upcase}VERSION = #{old_version}", "#{@name.upcase}VERSION = #{new_version}")
    else
      contents.gsub!(old_version, @version)
    end
    file = File.open(@version_file, 'w')
    file.write contents
    file.close
  end
end

