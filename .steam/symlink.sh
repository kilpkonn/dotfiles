gitdir=$(git rev-parse --show-toplevel)

ln -s -f $gitdir/.steam/csgo/autoexec.cfg ~/.steam/steam/userdata/119390087/730/local/cfg/autoexec.cfg
ln -s -f $gitdir/.steam/csgo/smokes.cfg ~/.steam/steam/userdata/119390087/730/local/cfg/smokes.cfg

ln -s --f $gitdir/.steam/tf2/autoexec.cfg ~/.steam/steam/steamapps/common/Team\ Fortress\ 2/tf/cfg/autoexec.cfg
ln -s -f $gitdir/.steam/tf2/binds.cfg ~/.steam/steam/steamapps/common/Team\ Fortress\ 2/tf/cfg/binds.cfg
ln -s -f $gitdir/.steam/tf2/crosshairs.cfg ~/.steam/steam/steamapps/common/Team\ Fortress\ 2/tf/cfg/crosshairs.cfg
ln -s -f $gitdir/.steam/tf2/graphics.cfg ~/.steam/steam/steamapps/common/Team\ Fortress\ 2/tf/cfg/graphics.cfg

