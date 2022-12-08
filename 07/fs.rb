class FileSystem
  def initialize(file)
    @file = file
    @current_directory = String.new
  end

  def process
    dir_sizes = Hash.new(0)
    commands.each do |cmd|
      if cmd.include?("$ cd")
        target = cmd.split.last
        if target == ".."
          @current_directory = @current_directory.split("/")[0..-2].join("/") + "/"
          @current_directory = "/" if @current_directory.empty?
        elsif target == "/"
          @current_directory = "/"
        else
          @current_directory = @current_directory.concat("#{target}/")
        end
      elsif cmd.include?("$ ls")
        next
      else
        size = cmd.split.first.to_i
        dir_sizes[@current_directory] += size
        dirs = @current_directory.split("/").reject(&:empty?)
        dirs.size.times do
          dirs.pop
          if dirs.empty?
            dir_sizes["/"] += size
          else
            dir_sizes["/#{dirs.join("/")}/"] += size
          end
        end
      end
    end
    dir_sizes
  end

  def sum_large_dirs
    process.each_value.select do |size|
      size <= 100000
    end.sum
  end

  def commands
    @_commands ||= File.readlines(@file, chomp: true)
  end
end
