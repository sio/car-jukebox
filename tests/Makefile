REQUIREMENTS_TXT=../requirements.txt requirements.txt
VENVDIR=$(abspath ../.venv-tests)
export YAMLLINT_CONFIG_FILE=$(abspath yamllint.yml)


export PY_COLORS=1
export ANSIBLE_FORCE_COLOR=1


test: venv
	$(VENV)/molecule $@


include Makefile.venv
Makefile.venv:
	curl \
		-o Makefile.fetched \
		-L "https://github.com/sio/Makefile.venv/raw/v2020.08.14/Makefile.venv"
	echo "5afbcf51a82f629cd65ff23185acde90ebe4dec889ef80bbdc12562fbd0b2611 *Makefile.fetched" \
		| sha256sum --check - \
		&& mv Makefile.fetched Makefile.venv


export PATH:=$(VENV):$(PATH)
