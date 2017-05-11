class Open
  def initialize(path)
    @path = path
  end
  def open
    Dir.chdir(@path)

    file_list = []

    Dir.glob("*") do | file_name |
      file_stat_obj = File.stat("#{@path}\\#{file_name}")
      file_list << {:name => file_name, :file => file_stat_obj.file?, :mtime => file_stat_obj.mtime}
    end

    file_id = 1 # ディレクトリの選択肢の番号の初期値
    open_fire_list = []

    file_list.each do |file|
      if file[:file] then
        printf("%2x\t%s\t%s\n", file_id, file[:mtime], file[:name])
        open_fire_list[file_id] = file[:name]
        file_id += 1
      else
        printf(" #\t%s\t%s\n", file[:mtime], file[:name])
      end
    end

    print "番号でファイルを選択してください"
    sel = gets.to_i

    while true
      if open_fire_list[sel]
        puts "----#{open_fire_list[sel]}の内容----"
        File.open("#{@path}\\#{open_fire_list[sel]}") do |f|
          f.each do |line|
            print line
          end
        end
        break

      else
        print "番号でファイルを選択してください"
        sel = gets.to_i
      end
    end
  end
end

# tpath = "C:\\Users\\Administrator\\Desktop\\group_b\\command"
# obj = Open.new(tpath)
# obj.open
