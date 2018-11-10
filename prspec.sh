#!/usr/bin/env bash

rspec $@ --require ./prspec.rb --format ParanoidFormatter
