%% Author: marcus
%% Created: 29 okt 2011
-module(holliday_table_service_test).

%%
%% Include files
%%
-include_lib("eunit/include/eunit.hrl").
-include("holliday.hrl").


setup() -> holliday_db:init(), holliday_table_sup:start_link(). 
cleanup({ok, _Pid}) -> ok.

%%
%% Test Functions
%%
start_table_test_() ->
	T=#table{uid=apa},
		{ setup,
	  fun()-> setup(),holliday_table_service:create_table(T) end,
	  fun cleanup/1,
	  ?_test(
		begin
			?assertEqual({ok, T#table.uid}, holliday_table_service:start_table(T#table.uid))
		end)
		}.
	

