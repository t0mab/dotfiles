#! /usr/bin/env bash

. ../helpers.sh

if [ -f /usr/bin/apt-get ]; then
	prefix="$HOME/.config/sublime-text-3"
else
	prefix="$HOME/Library/Application Support/Sublime Text 3"
fi

[ ! -d "$prefix/Packages/User" ] && mkdir -p "$prefix/Packages/User"

cp -v *.sublime-settings "$prefix/Packages/User"

# Golang
git_clone https://github.com/DisposaBoy/GoSublime.git "$prefix/Packages/GoSublime"

# Python
git_clone https://github.com/SublimeLinter/SublimeLinter-pep8.git "$prefix/Packages/SublimeLinter-pep8"
git_clone https://github.com/SublimeLinter/SublimeLinter3.git "$prefix/Packages/SublimeLinter"

# Theme
git_clone https://github.com/buymeasoda/soda-theme.git "$prefix/Packages/Theme - Soda"
git_clone https://github.com/jonschlinkert/sublime-monokai-extended.git "$prefix/Packages/sublime-monokai-extended"

# Markdown
git_clone https://github.com/SublimeText-Markdown/MarkdownEditing.git "$prefix/Packages/MarkdownEditing"

#git_clone https://github.com/SublimeCodeIntel/SublimeCodeIntel.git "$prefix/Packages/SublimeCodeIntel"
#git_clone https://github.com/alienhard/SublimeAllAutocomplete "$prefix/Packages/SublimeAllAutocomplete"
#git_clone https://github.com/SublimeText-Markdown/MarkdownEditing.git "$prefix/Packages/MarkdownEditing"
#git_clone https://github.com/vkocubinsky/SublimeTableEditor.git "$prefix/Packages/Table Editor"
