SHELL := /bin/bash 

VERSION=`cat version`

default: clean package

clean:
	rm webcam-utils-${VERSION} -rf
	rm webcam-utils_${VERSION}* -rf
	rm doc/*.1.gz -rf	

manpage:
	pandoc doc/webcam-utils.1.md -s -t man | gzip > doc/webcam-utils.1.gz
	pandoc doc/webcam-enable.1.md -s -t man | gzip > doc/webcam-enable.1.gz
	pandoc doc/webcam-disable.1.md -s -t man | gzip > doc/webcam-disable.1.gz
	pandoc doc/webcam-status.1.md -s -t man | gzip > doc/webcam-status.1.gz
	pandoc doc/webcam-set-default.1.md -s -t man | gzip > doc/webcam-set-default.1.gz

package: manpage
	mkdir webcam-utils-${VERSION}
	cd webcam-utils-*
	cp ./doc/*.1.gz webcam-utils-${VERSION}/ 
	cp bash-completion/webcam-set-default webcam-utils-${VERSION}/ 
	cp ./debian webcam-utils-${VERSION}/ -r
	cp ./webcam-*.sh webcam-utils-${VERSION}/
	tar -C webcam-utils-${VERSION}/ -cvaf webcam-utils_${VERSION}.orig.tar.xz ./
	cd webcam-utils-${VERSION} && debuild -us -uc

install:
	mkdir /usr/local/share/webcam-utils -p
	cp webcam-*.sh /usr/local/share/webcam-utils
	ln -s /usr/local/share/webcam-utils/webcam-enable.sh /usr/bin/webcam-enable -v
	ln -s /usr/local/share/webcam-utils/webcam-disable.sh /usr/bin/webcam-disable -v
	ln -s /usr/local/share/webcam-utils/webcam-status.sh /usr/bin/webcam-status -v
	ln -s /usr/local/share/webcam-utils/webcam-set-default.sh /usr/bin/webcam-set-default -v
	cp doc/*.1.gz /usr/share/man/man1
	cp bash-completion/webcam-set-default /usr/share/bash-completion/completions

uninstall:
	rm /usr/share/bash-completion/completions/webcam-set-default -f
	rm /usr/share/man/man1/webcam-*.1.gz -f
	rm /usr/bin/webcam-* -f
	rm /usr/share/webcam-utils -rf
