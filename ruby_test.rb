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

 