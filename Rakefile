require 'rake'
require 'erb'
require 'socket'

HOSTS_DIR = "hosts"

desc "install the dot files into user's home directory"
task :install, :host do |t, args|
  args.with_defaults(:host => Socket.gethostbyname(Socket.gethostname).first)
  excludes = %w[Rakefile README.rdoc LICENSE install]
  host_dir = File.join(Dir.pwd, HOSTS_DIR, args[:host])
  puts "Installing generic config files"
  process_dir(Dir.pwd, excludes + [HOSTS_DIR])
  if File.exist?(host_dir)
    puts "Installing host config files for #{args[:host]}"
    process_dir(host_dir, excludes)
  end
  update_submodules()
end

def process_dir(dir, excludes)
  replace_all = false
  Dir[File.join(dir, "*")].each do |file|
    file_name = File.basename(file)
    source = File.expand_path(file)
    target = File.join(ENV['HOME'], ".#{file_name}")
    next if excludes.include? file_name
    if File.exist?(target)
      if File.identical?(source, target)
        puts "\t- identical ~/.#{file_name}"
      elsif replace_all
        replace_file(target, source)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(target, source)
        when 'y'
          replace_file(target, source)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(source, target)
    end
  end
end

def update_submodules()
  puts "Updating git submodules"
  `git submodule update --init`
  `cd emacs.d/vendor/rinari && git submodule update --init`
end

def replace_file(target, source)
  system %Q{rm -rf target}
  link_file(source, target)
end

def link_file(source, target)
  puts "\t* linking #{target}"
  File.symlink(source, target)
end
