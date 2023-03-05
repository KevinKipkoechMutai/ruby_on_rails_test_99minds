# calculate the total size of given directory

def find_directory_size(directory)
    total_size = 0
    Dir.foreach(directory) do |filename|
        path = File.join(directory, filename)
        if filename != "." && filename != ".."
            if File.directory?(path)
                total_size += find_directory_size(path)
            else
                total_size += File.size(path)
            end
        end
    end
    total_size
end

# find sum of nested directories

def small_directories_sum(root_dir, max_size)
    total_size = 0
    Dir.foreach(root_dir) do |filename|
        path = File.join(root_dir, filename)
        if filename != "." && filename != ".."
            if File.directory?(path)
                dir_size = find_directory_size(path)
                if dir_size <= max_size
                    total_size += dir_size
                end
            end
        end
    end
    total_size
end

# use case
root_dir = "/a/e"
max_size = 100000

total_size = small_directories_sum(root_dir, max_size)
puts "Total size for directory e: #{total_size}"