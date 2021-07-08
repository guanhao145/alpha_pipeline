
VCS = vcs -sverilog +vc -Mupdate -line -full64

all:	clean unpacked
.PHONY: array_assignment_packed.v  array_assignment_unpacked.v

unpacked:
	$(VCS) unpacked.v
	./simv | tee program.out

array_assignment_packed.v:
	$(VCS) array_assignment_packed.v
	./simv | tee program.out

array_assignment_unpacked.v:
	$(VCS) array_assignment_unpacked.v
	./simv | tee program.out

clean:
	rm -rf cs* simv* ucli*
