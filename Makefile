.PHONY: install-dependencies keep-container-up gem-startup

gem-startup: install-dependencies keep-container-up

install-dependencies:
	bundle install

keep-container-up:
	while true; do sleep 60; done
