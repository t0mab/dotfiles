#! /usr/bin/zsh


# Load dotfiles alias
. ~/.zshrc

function pull-worktree {
	dotfiles subtree pull -P $1 $2 master --squash
}

cd ~

pull-worktree .config/nvim/bundle/airline https://github.com/bling/vim-airline.git
pull-worktree .config/nvim/bundle/ansible https://github.com/pearofducks/ansible-vim.git
pull-worktree .config/nvim/bundle/ctrlp https://github.com/ctrlpvim/ctrlp.vim.git
pull-worktree .config/nvim/bundle/delimitmate https://github.com/Raimondi/delimitMate.git
pull-worktree .config/nvim/bundle/deoplete https://github.com/Shougo/deoplete.nvim.git
pull-worktree .config/nvim/bundle/deoplete-go https://github.com/zchee/deoplete-go.git
pull-worktree .config/nvim/bundle/deoplete-jedi https://github.com/zchee/deoplete-jedi.git
pull-worktree .config/nvim/bundle/fugitive https://github.com/tpope/vim-fugitive.git
pull-worktree .config/nvim/bundle/gitgutter https://github.com/airblade/vim-gitgutter.git
pull-worktree .config/nvim/bundle/go https://github.com/fatih/vim-go.git
pull-worktree .config/nvim/bundle/gruvbox https://github.com/morhetz/gruvbox.git
pull-worktree .config/nvim/bundle/html5 https://github.com/othree/html5.vim.git
pull-worktree .config/nvim/bundle/indentpython https://github.com/vim-scripts/indentpython.vim.git
pull-worktree .config/nvim/bundle/jinja2 https://github.com/mitsuhiko/jinja2.git
pull-worktree .config/nvim/bundle/neomake https://github.com/benekastah/neomake
pull-worktree .config/nvim/bundle/scala https://github.com/derekwyatt/vim-scala.git
pull-worktree .config/nvim/bundle/surround https://github.com/tpope/vim-surround.git
pull-worktree .config/nvim/bundle/tcomment_vim https://github.com/tomtom/tcomment_vim.git
