#!/usr/bin/env bash

set -eu
source test_helper.sh

######################################################################
### test_fixture
test_fixture() {
  local in=$1/in
  local out=$1/out

  @run  test -f "$in"
  @run  test -f "$out"

  @run  ../../bin/align-equals "$in"
  @assert "$(< $out)"
}


describe 'spec'

for fixture_dir in $(find spec/ -mindepth 1 -maxdepth 1 -type d | sort); do
  it "$(basename $fixture_dir)"
    test_fixture $fixture_dir
done
