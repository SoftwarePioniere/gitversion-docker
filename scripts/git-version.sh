#!/bin/bash
echo  ":: run gitversion"
exec mono /usr/lib/GitVersion/tools/GitVersion.exe "$@"
