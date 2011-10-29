%% Author: marcus
%% Created: 29 okt 2011
%% Description: TODO: Add description to holliday_admin_service_test
-module(holliday_admin_service_test).

%%
%% Include files
%%
-include_lib("eunit/include/eunit.hrl").
-include("holliday.hrl").


%%
%% Test Functions
%%
start_table_test_() ->
	Table=#table{},
	?assertEqual([], holliday_admin_service:start_table(Table)).

