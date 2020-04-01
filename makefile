pep8unix: pep8-cli asem8 stripCR

pep8-cli: pep8.cpp
	c++ -o pep8-cli pep8.cpp
	strip pep8-cli
asem8: asem8.cpp
	c++ -o asem8 asem8.cpp
	strip asem8
stripCR: stripCR.cpp
	c++ -o stripCR stripCR.cpp
	strip stripCR
cleanall:
	rm pep8-cli asem8 stripCR

DEST=/opt/pep8

install: pep8unix
	install -d "$(DEST)"
	install -m755 pep8-cli asem8 "$(DEST)"
	install -m644 trap pep8os.pepo "$(DEST)"
	install -m755 bin/* /usr/local/bin

uninstall:
	rm -rf "$(DEST)"
	rm /usr/local/bin/pep8-cli /usr/local/bin/asem8
