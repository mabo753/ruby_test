class Ls
  def initialize(path)
    @path = path
  end

  def ls
    Dir.chdir(@path)

    file_list = []

    Dir.glob("*") do | file_name |
      file_stat_obj = File.stat("#{@path}\\#{file_name}")
      file_list << [file_name,file_stat_obj.mtime]
    end

    file_list.sort!

    file_list.each do |file|
        printf("  \t%s\t%s\n", file[1], file[0])
    end
  end

end

#tpath = "C:\\Users\\Administrator\\Desktop\\group_b\\command"
#obj = Ls.new(tpath)
#obj.ls
