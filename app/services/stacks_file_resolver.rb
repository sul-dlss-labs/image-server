class StacksFileResolver < Riiif::FileSystemFileResolver
  def initialize(base_path:)
    @base_path = base_path
  end

  def pattern(id)
    raise ArgumentError, "Invalid characters in id `#{id}`" unless id =~ /\A[\w\-:\/\.]+\.(#{input_types.join('|')})\Z/
    path = File.expand_path(File.join(base_path, id))

    raise ArgumentError, "Directory traversal detected with id `#{id}`" unless path.starts_with?(File.expand_path(base_path))

    path
  end
end
