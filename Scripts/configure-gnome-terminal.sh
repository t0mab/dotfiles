#! /bin/sh

gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color_same_as_fg --type bool false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors --type bool false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_darkness --type float 0.88
gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_type --type string "transparent"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/login_shell --type bool true
gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#070736364242:#DCDC32322F2F:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/alternate_screen_scroll --type bool true
gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#fdfdf6f6e3e3"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/visible_name --type string "Default"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color --type string "#58586e6e7575"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color --type string "#65657b7b8383"


gconftool-2 --set /apps/gnome-terminal/keybindings/move_tab_right --type string "<Primary><Shift>Right"
gconftool-2 --set /apps/gnome-terminal/keybindings/move_tab_left --type string "<Primary><Shift>Left"
gconftool-2 --set /apps/gnome-terminal/keybindings/prev_tab --type string "<Shift>Left"
gconftool-2 --set /apps/gnome-terminal/keybindings/next_tab --type string "<Shift>Right"
