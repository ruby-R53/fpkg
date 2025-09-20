PREFIX = /usr/local

install:
	install -m 755 fpkg -t ${PREFIX}/bin/
	mkdir -p /etc/fpkg/
	install -m 644 bashrc -t /etc/fpkg/
	install -m 644 fpkg.conf -t /etc/fpkg/
	install -m 644 fpkg.bashcompletion -t /usr/share/bash-completion/completions/

uninstall:
	rm /usr/share/bash-completion/completions/fpkg.bashcompletion
	rm -r /etc/fpkg/
	rm ${PREFIX}/bin/fpkg
