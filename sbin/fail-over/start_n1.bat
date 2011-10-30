echo starting node n1, waiting for start on backup node n2@marcus-datorn
erl -sname n1 -cookie kaka -config n1.config -pa ../../ebin -s application start holliday
pause
