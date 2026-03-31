#!/bin/bash
git log --pretty=format:'%ct|%aN|%H|%s' --name-status --no-renames --reverse
