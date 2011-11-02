%% Author: marcus
%% Created: 30 okt 2011

-module(holliday_table_repo_test).

%%
%% Include files
%%
-include_lib("eunit/include/eunit.hrl").
-include("holliday.hrl").

%%
%% Test Functions
%%
setup() ->
	holliday_db:init().

cleanup(_) ->
	holliday_db:stop().

create_table_test_() ->
	Table = #table{uid=2, node=node(), seat_count=4},

	{ setup,
	  fun setup/0,
	  fun cleanup/1,
		?_test(
		?assertEqual({ok, Table}, holliday_table_repo:create(Table))
	  		)
	  }.

get_table_test_() ->
	T = #table{uid=3, node=node(), seat_count=6},

	{ setup,
	  fun () ->  setup(), holliday_table_repo:create(T) end,
	  fun cleanup/1,
		?_test(
		  ?assertEqual({ok, T}, holliday_table_repo:get(T#table.uid))
	  		)
	  }.
