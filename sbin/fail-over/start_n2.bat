echo starting node n2, waiting for start on primary node n1@marcus-datorn
erl -sname n2 -cookie kaka -config n2.config -pa ../../ebin 
pause
