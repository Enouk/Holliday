-module(holliday_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1, start_phase/3]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(StartType, StartArgs) ->
	erlang:display({"Starting holliday", StartType, StartArgs}),
    holliday_sup:start_link().

start_phase(Phase, Type, PhaseArgs) ->
	erlang:display({"Start phase holliday", Phase, Type, PhaseArgs}),
	ok.

stop(_State) ->
    ok.
