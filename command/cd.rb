class Cd
  def initialize(path)
    @path = path
  end
  def cd
    Dir.chdir(@path)

    file_list = []

    Dir.glob("*") do | file_name |
      file_stat_obj = File.stat("#{@path}\\#{file_name}")
      file_list << {:name => file_name, :directory => file_stat_obj.directory?, :mtime => file_stat_obj.mtime}
    end

    p file_list

    directory_id = 1 # ディレクトリの選択肢の番号の初期値
    directory_list = []

    file_list.each do |file|
      if file[:directory] then
        # print "#{directory_id}  #{file[:mtime]} #{file[:name]}\n"
        printf("%2x\t%s\t%s\n", directory_id, file[:mtime], file[:name])
        directory_list[directory_id] = file[:name]
        directory_id += 1
      else
        # print "#  #{file[:mtime]}  #{file[:name]}\n"
        printf(" #\t%s\t%s\n", file[:mtime], file[:name])
      end
    end

    print "番号でファイルを選択してください"
    sel = gets.to_i

    while true
      if sel == 0
        # p Dir.pwd()
        Dir.chdir("#{@path}\\..\\")
        break
      elsif directory_list[sel]
        # p Dir.pwd()
        Dir.chdir("#{@path}\\#{directory_list[sel]}\\")
        break
      else
        print "番号でファイルを選択してください"
        sel = gets.to_i
      end
    end
    Dir.pwd()
  end
end
