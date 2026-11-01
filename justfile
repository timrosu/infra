# vim: set ft=make :
set quiet
set lazy

# commands
last-treefmt-log:= `find /nix/store -name '*-treefmt-check.drv' -printf '%T@ %p\n' | sort -n | tail -1 | cut -d' ' -f2-`

# aliases
alias f := format
alias c := check
alias u := update
alias cl := check-log
alias dh := disable-hooks
alias eh := enable-hooks


### format ###

[group('nix')]
format:
	nix fmt 

### check ###

[group('check')]
check: check-nix

[group('check')]
[group('nix')]
check-nix:
	nix flake check -v

[group('check')]
check-log:
	nix log {{last-treefmt-log}}

### update ###

[group('update')]
update: update-nix check

[group('update')]
[group('nix')]
update-nix:
	nix flake update

### git ###

[group('git')]
disable-hooks:
	git config core.hooksPath /dev/null

[group('git')]
enable-hooks:
	git config --unset core.hooksPath


[no-quiet]
[group('git')]
diff arg *file:
	-git diff {{arg}} {{file}}

[group('git')]
diffq *file: (diff '--quiet' file)
