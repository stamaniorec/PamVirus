require 'fileutils'

root = ARGV[0]
icon = ARGV[1]
unless root && icon
	puts "Argument missing"
	exit 1
end

unless Dir.exist? root
  puts "No such directory."
  exit 2
end

unless File.exist? icon
  puts "Incorrect icon path."
  exit 3
end

def get_folders_from(folder)
  Dir.glob("#{folder}/**").select{ |f| File.directory? f }
end

def get_base(path)
  path.split('/')[0...-1].join('/')
end

def get_new_name(old_name, char_count)
  base = get_base old_name
  "#{base}/I_Love_Pami#{"." * char_count}"
end

def pamify(folder, icon)
  folders = get_folders_from folder
  
  return if folders.empty?
  
  folders.each_with_index do |folder, i|
    new_name = get_new_name(folder, i)
    
    FileUtils.mv(folder, new_name)
    system("gvfs-set-attribute -t string #{new_name} metadata::custom-icon file://#{icon}")
    
    pamify new_name, icon
  end
end

pamify(File.realpath(root), File.realpath(icon))
