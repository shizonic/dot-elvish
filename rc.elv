# DO NOT EDIT THIS FILE DIRECTLY
# This is a file generated from a literate programing source file located at
# https://github.com/zzamboni/dot-elvish/blob/master/rc.org.
# You should make any changes there and regenerate it from Emacs org-mode using C-c C-v t

E:GOPATH = ~/Dropbox/Personal/devel/go
E:RACKETPATH = ~/Library/Racket/7.1
paths = [
  ~/bin
  $E:GOPATH/bin
  $E:RACKETPATH/bin
  /usr/local/opt/coreutils/libexec/gnubin
  /usr/local/opt/python/libexec/bin
  ~/Dropbox/Personal/devel/hammerspoon/spoon/bin
  ~/.gem/ruby/2.4.0/bin
  /opt/X11/bin
  /Library/TeX/texbin
  /usr/local/bin
  /usr/local/sbin
  /usr/sbin
  /sbin
  /usr/bin
  /bin
]

use epm

epm:install &silent-if-installed=$true   \
  github.com/zzamboni/elvish-modules     \
  github.com/zzamboni/elvish-completions \
  github.com/zzamboni/elvish-themes      \
  github.com/xiaq/edit.elv               \
  github.com/muesli/elvish-libs          \
  github.com/iwoloschin/elvish-packages

use github.com/zzamboni/elvish-modules/proxy
proxy:host = "http://proxy.corproot.net:8079"

proxy:test = {
  and ?(test -f /etc/resolv.conf) \
  ?(egrep -q '^(search|domain).*(corproot.net|swissptt.ch)' /etc/resolv.conf)
}

proxy:autoset

use re

use readline-binding

edit:insert:binding[Alt-Backspace] = $edit:kill-small-word-left~

edit:insert:binding[Alt-d] = $edit:kill-small-word-right~

use github.com/zzamboni/elvish-modules/alias

alias:new dfc e:dfc -W -l -p -/dev/disk1s4,devfs
alias:new ls e:lsd
alias:new more less
alias:new v vagrant

use github.com/xiaq/edit.elv/smart-matcher
smart-matcher:apply

use github.com/zzamboni/elvish-completions/vcsh
use github.com/zzamboni/elvish-completions/cd
use github.com/zzamboni/elvish-completions/ssh
use github.com/zzamboni/elvish-completions/builtins

use github.com/zzamboni/elvish-completions/git
git:git-command = hub
git:init

use github.com/zzamboni/elvish-completions/comp

use github.com/zzamboni/elvish-themes/chain
chain:bold-prompt = $true

chain:segment-style = [
  &dir=          session
  &chain=        session
  &arrow=        session
  &git-combined= session
]

chain:glyph[git-ahead]  = "⬆ "
chain:glyph[git-staged] = "✔ "

edit:prompt-stale-transform = { each [x]{ styled $x[text] "gray" } }

edit:-prompt-eagerness = 10

use github.com/zzamboni/elvish-modules/long-running-notifications

use github.com/zzamboni/elvish-modules/bang-bang

use github.com/zzamboni/elvish-modules/dir
alias:new cd &use=[github.com/zzamboni/elvish-modules/dir] dir:cd
alias:new cdb &use=[github.com/zzamboni/elvish-modules/dir] dir:cdb

edit:insert:binding[Alt-i] = $dir:history-chooser~

edit:insert:binding[Alt-b] = $dir:left-small-word-or-prev-dir~
edit:insert:binding[Alt-f] = $dir:right-small-word-or-next-dir~

use github.com/zzamboni/elvish-modules/terminal-title

private-loaded = ?(use private)

use github.com/zzamboni/elvish-modules/atlas

use github.com/zzamboni/elvish-modules/opsgenie

use github.com/zzamboni/elvish-modules/leanpub

E:LESS = "-i -R"

E:EDITOR = "vim"

E:LC_ALL = "en_US.UTF-8"

use github.com/zzamboni/elvish-modules/util

use github.com/muesli/elvish-libs/git

use github.com/iwoloschin/elvish-packages/update
update:curl-timeout = 3
update:check-commit &verbose

use swisscom

-exports- = (alias:export)
