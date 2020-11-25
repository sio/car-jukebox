include Makefile.vars


INVENTORY?=inventory.yml
SHELL=/bin/bash


ANSIBLE_PLAYBOOK=$(VENV)/ansible-playbook
export ANSIBLE_PYTHON_INTERPRETER=$(abspath $(VENV))/python
export ANSIBLE_STDOUT_CALLBACK?=yaml


jukebox: venv
	$(ANSIBLE_PLAYBOOK) -i $(INVENTORY) $@.yml


include Makefile.venv
Makefile.venv:
	curl \
		-o Makefile.fetched \
		-L "https://github.com/sio/Makefile.venv/raw/v2020.08.14/Makefile.venv"
	echo "5afbcf51a82f629cd65ff23185acde90ebe4dec889ef80bbdc12562fbd0b2611 *Makefile.fetched" \
		| sha256sum --check - \
		&& mv Makefile.fetched Makefile.venv
