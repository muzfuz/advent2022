class FileSystem

  TOTAL_MEMORY = 70000000
  MIN_MEMORY = 30000000

  def initialize(file)
    @file = file
    @directories = Hash.new(0)
    process
  end

  attr_reader :directories

  def process
    current_directory = String.new
    commands.each do |cmd|
      if cmd.include?("$ cd")
        current_directory = cd(cmd.split.last, current_directory)
      elsif cmd.include?("$ ls")
        next
      else
        add_file_size_to_dir(cmd.split.first.to_i, current_directory)
        add_file_size_to_parent_dirs(cmd.split.first.to_i, current_directory)
      end
    end
  end

  def cd(target, current_directory)
    case target
    when "/" || current_directory.empty?
      "/"
    when ".."
      current_directory.split("/")[0..-2].join("/") + "/"
    else
      current_directory.concat("#{target}/")
    end
  end

  def add_file_size_to_dir(size, current_directory)
    directories[current_directory] += size
  end

  def add_file_size_to_parent_dirs(size, current_directory)
    dirs = current_directory.split("/").reject(&:empty?)
    dirs.size.times do
      dirs.pop
      if dirs.empty?
        directories["/"] += size
      else
        directories["/#{dirs.join("/")}/"] += size
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
