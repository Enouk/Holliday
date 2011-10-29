%% Author: marcus
%% Created: 29 okt 2011
%% Description: TODO: Add description to holliday_admin_service
-module(holliday_table_service).

%%
%% Include files
%%
-include("holliday.hrl").
%%
%% Exported Functions
%%
-export([create_table/1, start_table/1]).

%%
%% API Functions
%%

%%---------------------------------------------------------------
%% @spec create_table(table()) -> {ok, table()}.
%% @doc Create a new table. 
%%---------------------------------------------------------------
create_table(Table) ->
	holliday_table_repo:create(Table).
  
  
%%---------------------------------------------------------------
%% @spec start_table(uid()) -> {ok, uid} | {error, Error}.
%% @doc Start the table with the given uid(). 
%%---------------------------------------------------------------
start_table(TableUID) ->	
	case holliday_table_repo:get(TableUID) of
		{ok, TableState} -> 
			{ok, _PID} = holliday_table_sup:start_table(TableState),
			{ok, TableUID};
		{error, Error } ->
			{error, Error }
	end.


