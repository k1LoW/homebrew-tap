depsdev:
	brew install Songmu/tap/maltmill

update/%:
	maltmill -w $*.rb

create/%:
	maltmill new -w k1LoW/$*

update-all:
	grep -l darwin *.rb | xargs -n 1 maltmill -w

install-all:
	grep -l darwin *.rb | sed 's/.rb//' | xargs -n 1 -I{} brew install {}

install-all-linux:
	brew tap k1low/tap
	grep -l linux *.rb | sed 's/.rb//' | xargs -n 1 -I{} brew install {}
