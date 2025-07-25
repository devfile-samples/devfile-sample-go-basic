#!/usr/bin/env bash

set -x

SAMPLE_PATH="$(pwd)"
DEVFILE_PATH=${DEVFILE_PATH:-"$SAMPLE_PATH/devfile.yaml"}

REGISTRY_PATH=${REGISTRY_PATH:-"../registry"}

args=""

if [ ! -z "${1}" ]; then
  args="-odoPath ${1} ${args}"
fi

if [ ! -f "$DEVFILE_PATH" ]; then
  echo "ERROR: Devfile not found at path $DEVFILE_PATH"
  exit 1
fi

if [ ! -d "$REGISTRY_PATH/tests/odov3" ]; then
  echo "ERROR: Registry test directory not found at $REGISTRY_PATH/tests/odov3"
  echo "Please ensure the devfile/registry repository is cloned."
  exit 1
fi

SAMPLE_NAME=$(yq eval '.metadata.name' "$DEVFILE_PATH")

cd "$REGISTRY_PATH/tests/odov3"

ginkgo run --procs 1 \
  --timeout 3h \
  --slow-spec-threshold 120s \
  . -- -stacksPath "$SAMPLE_PATH" -stackDirs "." ${args}

echo "======================="
echo "ODO v3 test completed!"
echo "=======================" 