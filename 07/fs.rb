class FileSystem

  TOTAL_MEMORY = 70000000
  MIN_MEMORY = 30000000

  def initialize(file)
    @file = file
    @current_directory = String.new
    process
  end

  attr_reader :directories

  def process
    @directories = Hash.new(0)
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
        @directories[@current_directory] += size
        dirs = @current_directory.split("/").reject(&:empty?)
        dirs.size.times do
          dirs.pop
          if dirs.empty?
            @directories["/"] += size
          else
            @directories["/#{dirs.join("/")}/"] += size
          end
        end
      end
    end
  end

  def sum_large_dirs
    directories.each_value.select do |size|
      size <= 100000
    end.sum
  end

  def free_up_memory
    required_additional_memory = MIN_MEMORY - (TOTAL_MEMORY - directories["/"])
    directories.values.sort.find do |size|
      size >= required_additional_memory
    end
  end

  def commands
    @_commands ||= File.readlines(@file, chomp: true)
  end
end
