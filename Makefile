SHELL := /bin/bash 

default: clean package

clean:
	rm webcam-utils-`cat version` -rf
	rm webcam-utils_`cat version`* -rf
	rm doc/*.1.gz -rf	

manpage:
	pandoc doc/webcam-utils.1.md -s -t man | gzip > doc/webcam-utils.1.gz
	pandoc doc/webcam-enable.1.md -s -t man | gzip > doc/webcam-enable.1.gz
	pandoc doc/webcam-disable.1.md -s -t man | gzip > doc/webcam-disable.1.gz
	pandoc doc/webcam-status.1.md -s -t man | gzip > doc/webcam-status.1.gz
	pandoc doc/webcam-set-default.1.md -s -t man | gzip > doc/webcam-set-default.1.gz

package: manpage
	mkdir webcam-utils-`cat version`
	cd webcam-utils-*
	cp ./doc/*.1.gz webcam-utils-`cat version`/ 
	cp bash-completion/webcam-set-default webcam-utils-`cat version`/ 
	cp ./debian webcam-utils-`cat version`/ -r
	cp ./webcam-*.sh webcam-utils-`cat version`/
	tar -C webcam-utils-`cat version`/ -cvaf webcam-utils_`cat version`.orig.tar.xz ./
	cd webcam-utils-`cat version` && debuild -us -uc

install:
	mkdir /usr/share/webcam-utils -p
	cp webcam-*.sh /usr/share/webcam-utils
	ln -s /usr/share/webcam-utils/webcam-enable.sh /usr/bin/webcam-enable -v
	ln -s /usr/share/webcam-utils/webcam-disable.sh /usr/bin/webcam-disable -v
	ln -s /usr/share/webcam-utils/webcam-status.sh /usr/bin/webcam-status -v
	ln -s /usr/share/webcam-utils/webcam-set-default.sh /usr/bin/webcam-set-default -v
