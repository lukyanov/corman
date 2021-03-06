.PHONY: all get-deps compile clean test-unit test-ct check

REBAR := $(shell which ./rebar || which rebar)

all: get-deps compile

compile:
		$(REBAR) compile

get-deps:
		$(REBAR) get-deps

test-unit: all
		$(REBAR) eunit skip_deps=true

test-ct: all
		$(REBAR) ct skip_deps=true

check:		test-unit test-ct

clean:
		$(REBAR) clean
		rm -rf ./ebin
		rm -rf ./logs
		rm -rf ./erl_crash.dump
