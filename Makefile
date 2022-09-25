depsdev:
	brew install Songmu/tap/maltmill

update/%:
	maltmill -w $*.rb

create/%:
	maltmill new -w k1LoW/$*

update-all:
	grep -l darwin *.rb | xargs -n 1 maltmill -w
