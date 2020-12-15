all:
	erl -pa ebin -sname 10250 -run dbase_application boot -setcookie abc -detached
clean:
	rm -rf  *~ */*~ */*/*~ *.beam *erl_crash*
doc_gen:
	rm -rf  node_config logfiles doc/*;
	erlc ../doc_gen.erl;
	erl -s doc_gen start -sname doc

release:
	rm -rf ebin/* *.beam erl_cr* *~ */*~;
	cp ../../infra_2/dbase_service/src/*.app ebin;
	erlc -o ebin ../../infra_2/dbase_service/src/*.erl;
	cp ../../infra_2/common/src/*.app ebin;
	erlc -o ebin ../../infra_2/common/src/*.erl;
	cp src/*.app ebin;
	erlc -o ebin src/*.erl

test:
	rm -rf ebin/* *.beam erl_cr*;
	cp ../../infra_2/dbase_service/src/*.app ebin;
	erlc -o ebin ../../infra_2/dbase_service/src/*.erl;
	cp ../../infra_2/common/src/*.app ebin;
	erlc -o ebin ../../infra_2/common/src/*.erl;
	cp src/*.app ebin;
	erlc -o ebin src/*.erl;
	erl -pa ebin -s dbase_application boot -sname 10250 -setcookie abc
