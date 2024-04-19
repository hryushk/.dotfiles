#!/usr/bin/env bash

jq '.[] | select(.location=="Stockholm")' json