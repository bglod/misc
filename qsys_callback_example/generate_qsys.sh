#!/usr/bin/env bash

# Stop script if any command fails
set -e

qsys_filename="cb_example_system"
workdir="work"

rm -rf "${workdir}"
mkdir -p "${workdir}"
pushd "${workdir}" > /dev/null

# Copy Qsys IPX file into work so we can locate custom components without
# using the --search-path command-line option. If, instead, you want to use
# this parameter, it can be specified with any of the qsys-* commands
# (e.g. qsys-script, qsys-generate, qsys-edit, etc.).
#   Multiple search paths are separated by commas. Can also use /path/**/*
#   globbing to include all subdirs. The '$' path is the default search path,
#   which should almost always be included.
#     e.g.: qsys-edit --search-path="../qsys/**/*,$" system.qsys
cp -f ../ip.ipx ./

# Generate the .qsys from the Tcl script
#   The --cmd stuff isn't necessary because defaults are specified in the .tcl
#   Specifying it here to be explicit.
qsys-script   --cmd="set qsys_name ${qsys_filename}; set device 5CEBA2F17A7" \
              --script="../${qsys_filename}.tcl"

# Generate the HDL from the .qsys
#qsys-generate --synthesis=VHDL "${qsys_filename}.qsys"

# Open Qsys GUI
#qsys-edit "${qsys_filename}.qsys"

popd > /dev/null

# Return to normal
set +e
