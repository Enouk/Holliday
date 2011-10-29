%% Author: marcus
%% Created: 20 okt 2011
%% Description: TODO: Add description to db
-module(holliday_db).

%%
%% Include files
%%
-include("holliday.hrl").

%%
%% Exported Functions
%%
-export([create_schema/0, init/0, stop/0, do/1, write/1, read/2, delete/2]).

%%
%% API Functions
%%
create_schema() ->
	mnesia:create_schema([node(),nodes()]),
	mnesia:start(),
	create_tables().

init() ->
	mnesia:start(),
	create_tables().

stop() ->
	mnesia:stop().

do(Q) ->
 	F = fun() -> qlc:e(Q) end,
   	Val= mnesia:transaction(F),
    Val.

write(Record) ->
	Fun = fun()-> 
				  mnesia:write(Record)
		  end,
	mnesia:transaction(Fun).

read(Tab, Key) ->
	Fun = fun() ->
				  mnesia:read({Tab, Key})
		  end,
	mnesia:transaction(Fun).

delete(Tab, Key) ->
		Fun = fun() ->
				  mnesia:delete({Tab, Key})
		  end,
	mnesia:transaction(Fun).

%%
%% Local Functions
%%
create_tables() ->
		mnesia:create_table(table, 
						[{ram_copies,[node()|nodes()]},
						 {record_name, table},
						 {attributes, record_info(fields, table)}]).
