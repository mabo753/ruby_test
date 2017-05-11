require_relative "ls"
require_relative "cd"
require_relative "open"
require_relative "mkdir"
require_relative "touch"
LS="ls"
CD="cd"
OPEN="open"
MKDIR="mkdir"
TOUCH="touch"
QUIT="quit"
EXIT="exit"

#シェルを動作するクラス
class Shell
  def initialize
    #pathの最下部の取得
    full_path = Dir.pwd
    @last_path = full_path.slice(/\/(\w)+$/)
    @current_path = full_path
  end
  #シェルを動作するメソッド
  def shell
    #コマンドの受付
    puts "please enter command."
    while TRUE
      @last_path = @current_path.slice(/\/(\w)+$/)
      print "#{@last_path}:>"
      @command = gets.chop
      #コマンド解析
      if @command==LS
        ls = Ls.new(@current_path)
        ls.ls
      end
      if @command == CD
        cd = Cd.new(@current_path)
        @current_path = cd.cd
      end
      if @command == OPEN
        op = Open.new(@current_path)
        op.open
      end
      if @command == MKDIR
        mk = Mkdir.new
        mk.mkdir
      end
      if @command == TOUCH
        to = Touch.new
        to.touch
      end
      if @command == QUIT
        exit(0)
      end
      if @command == EXIT
        exit(0)
      end
    end
  end
end

sh = Shell.new
sh.shell
