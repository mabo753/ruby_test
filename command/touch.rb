class Touch
  def touch
    print "作成するファイルの名前を入力してください："
    filename = gets.chop #ディレクトリ名の入力待機状態
    dirglob = Dir.glob("*") #カレントディレクトリのファイルを配列に入れる

    dirglob.each do |comp| #配列に入れた要素を１つずつ見る
      filestat = File.stat(comp) #ディレクトリかどうかの判断
      if filestat.directory? == false && comp == filename #ディレクトリではない、かつファイル名が同じ
        puts "すでに存在するファイルです"
      elsif
        File.open(filename, "w").close() #新規空ファイルを作成
      end
    end
  end
end
