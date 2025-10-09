PREFIX = /usr/local

install:
	install -m 755 fpkg -t ${PREFIX}/bin/
	mkdir -p /etc/fpkg/
	install bashrc -t /etc/fpkg/
	install fpkg.conf -t /etc/fpkg/
	install fpkg.bashcompletion -t /usr/share/bash-completion/completions/
	mkdir -p /etc/fpkg/modules/
	install modules/* -t /etc/fpkg/modules/

uninstall:
	rm /usr/share/bash-completion/completions/fpkg.bashcompletion
	rm -r /etc/fpkg/
	rm ${PREFIX}/bin/fpkg
