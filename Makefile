
RELEASE=0.1
PKG=Netdot
DST = unstable
ETC = ins.sample.data netdot.relationships netdot.schema
DOC = TODO ChangeLog MILESTONES README
BIN = initacls.mysql initacls.Pg setup-class-dbi mason.pl initdb ins.sample.data insert-metadata updatenodes.pl
HTML = create.html search.html form.html sortresults.html view.html update.html delete.html search_obj.html header footer main.html browse.html table.html banner style.css footer2 node.html error.html
NETVIEWER = Netviewer.pm nv.categories nv.ifTypes
LIB = Netviewer.pm nv.categories nv.ifTypes GUI.pm

######################################################################
help:
	@echo "This makefile will help with making a distribution"
	@echo "In the meantime, it doesn't do much.  :-("
	@echo ""
	@echo "make unstable | stable | dist RELEASE=<release-ver>"
	@echo "RELEASE defaults to $(RELEASE)"
	@echo ""
	@echo "Before making a dist, be sure to make stable"
	@echo ""
	@echo "For testing purposes on tiroloco, run"
	@echo "make test"

unstable: DST = unstable
unstable: dir bin html lib doc make
stable: DST = stable
stable: dir etc make
test: DST = /home/netdot/public_html
test: testing nvtest


######################################################################
# following is for testing files on tiroloco
testing:
	cp $(HTML) $(DST)/htdocs
	cp -f $(DOC) $(DST)/doc


######################################################################
# netviewer testing
.PHONY: nvtest
nvtest: DST = /home/netdot/public_html
nvtest: 
	cp -f $(NETVIEWER) $(DST)/lib/Netdot



######################################################################
install:
	@echo "Not here...."


######################################################################
dist:
	mkdir $(PKG)-$(RELEASE)
	cp -a stable/* $(PKG)-$(RELEASE)
	tar cf dists/$(PKG)-$(RELEASE).tar $(PKG)-$(RELEASE)
	rm -rf $(PKG)-$(RELEASE)

######################################################################
dir: 
	mkdir -p $(DST)/lib
	mkdir -p $(DST)/bin
	mkdir -p $(DST)/htdocs
	mkdir -p $(DST)/doc


######################################################################
bin: $(BIN)
	cp -f $? $(DST)/bin

######################################################################
doc: $(DOC)
	cp -f $? $(DST)/doc

######################################################################
etc: $(ETC)
	cp -f $? $(DST)/etc

######################################################################
html: $(HTML)
	cp -f $? $(DST)/htdocs

######################################################################
lib: $(LIB)
	cp -f $? $(DST)/lib

######################################################################
make:
	cp -f Makefile.db $(DST)/bin/Makefile
	cp -f Makefile.htdocs $(DST)/htdocs/Makefile
	cp -f Makefile.dist $(DST)/Makefile




# leave a blank
