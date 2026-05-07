depsdev:
	brew install Songmu/tap/maltmill

update/%:
	maltmill -w $*.rb

create/%:
	maltmill new -w k1LoW/$*

update-cask/%:
	./scripts/update-cask.sh Casks/$*.rb

update-casks-all:
	@for f in Casks/*.rb; do ./scripts/update-cask.sh "$$f"; done

update-all:
	grep -l darwin *.rb | xargs -n 1 maltmill -w
	$(MAKE) update-casks-all
