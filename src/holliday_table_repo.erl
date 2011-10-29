%% Author: marcus
%% Created: 20 okt 2011
%% Description: TODO: Add description to table_repo
-module(holliday_table_repo).

%%
%% Include files
%%
-include("holliday.hrl").
%%
%% Exported Functions
%%
-export([get/1, create/1, update/1]).

%%
%% API Functions
%%
create(Table) when is_record(Table, table) ->
	%% TODO add check to not overwrite
	{atomic, ok} = holliday_db:write(Table),
	{ok, Table}.
	
  
get(TableUID) ->
	{atomic, Table} = holliday_db:read(table, TableUID),
	{ok, Table}.

update(Table) when is_record(Table, table) ->
	{atomic, ok} = holliday_db:write(Table),
	{ok, Table}.
	

