class Mkdir
  def mkdir
    flag = false
    print "作成するディレクトリ名を入力してください："
    filename = gets.chop#ディレクトリ名を入力できる
    dirglob = Dir.glob("*") #カレントディレクトリのファイルを配列にぶち込む
    dirglob.each do |comp| #dirglobはデフォルトで配列になっているので、その回数だけループする
      filestat = File.stat(comp)
      if filestat.directory? == true && comp == filename#filestatがディレクトリか判断しディレクトリならば比較用変数に入れキーボード入力した文字列と比較
        puts "すでに存在するディレクトリです"
        flag = true
      end
    end
    if flag == false
      Dir.mkdir(filename)#ディレクトリを作成
      puts "ディレクトリを作成しました☆"
    end
  end
end
