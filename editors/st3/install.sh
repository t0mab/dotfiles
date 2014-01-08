#! /usr/bin/env bash

. ../../helpers.sh

if [ -f /usr/bin/apt-get ]; then
	prefix="$HOME/.config/sublime-text-3"
else
	prefix="$HOME/Library/Application Support/Sublime Text 3"
fi

[ ! -d "$prefix/Packages/User" ] && mkdir -p "$prefix/Packages/User"

cp -v GoSublime.sublime-settings "$prefix/Packages/User"
cp -v Preferences.sublime-settings "$prefix/Packages/User"
cp -v Pylinter.sublime-settings "$prefix/Packages/User"
cp -v HTML.sublime-settings "$prefix/Packages/User"
cp -v Python.sublime-settings "$prefix/Packages/User"

git_clone https://github.com/SublimeCodeIntel/SublimeCodeIntel.git "$prefix/Packages/SublimeCodeIntel"
git_clone https://github.com/biermeester/Pylinter.git "$prefix/Packages/Pylinter"
git_clone https://github.com/alienhard/SublimeAllAutocomplete "$prefix/Packages/SublimeAllAutocomplete"
git_clone https://github.com/DisposaBoy/GoSublime.git "$prefix/Packages/GoSublime"
git_clone https://github.com/buymeasoda/soda-theme.git "$prefix/Packages/Theme - Soda"
git_clone https://github.com/jonschlinkert/sublime-monokai-extended.git "$prefix/Packages/sublime-monokai-extended"
