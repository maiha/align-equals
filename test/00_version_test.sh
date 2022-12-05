#!/usr/bin/env bash

set -eu
source test_helper.sh

describe '--version'
it "shows version numbers"
  @run  ../../bin/align-equals --version
  @grep '^align-equals [0-9]*\.[0-9]*\.[0-9]'

