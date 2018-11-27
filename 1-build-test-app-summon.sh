#! /bin/bash

pushd test-app-summon
	docker build -t test-app-summon:ansible .
popd
