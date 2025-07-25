#!/usr/bin/env bash

set -x

# Path to the devfile in this sample repository
SAMPLE_PATH="$(pwd)"
DEVFILE_PATH=${DEVFILE_PATH:-"$SAMPLE_PATH/devfile.yaml"}


# Path to the devfile/registry repository (assumed to be cloned as a sibling)
REGISTRY_PATH=${REGISTRY_PATH:-"../registry"}

POSITIONAL_ARGS=()
SAMPLES="false"
VERBOSE="false"

while [[ $# -gt 0 ]]; do
  case $1 in
    -s|--samples)
      SAMPLES="true"
      shift # past argument
      ;;
    -v|--verbose)
      VERBOSE="true"
      shift # past argument
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

# Check if devfile exists
if [ ! -f "$DEVFILE_PATH" ]; then
  echo "ERROR: Devfile not found at path $DEVFILE_PATH"
  exit 1
fi

# Check if the devfile/registry test directory exists
if [ ! -d "$REGISTRY_PATH/tests/validate_devfile_schemas" ]; then
  echo "ERROR: Registry test directory not found at $REGISTRY_PATH/tests/validate_devfile_schemas"
  echo "Please ensure the devfile/registry repository is cloned."
  exit 1
fi

echo "======================="
echo "Validating devfile schema for single sample: ${DEVFILE_PATH}"
echo "Registry path: ${REGISTRY_PATH}"
echo "======================="

# Change to the registry test directory and run the validation
cd "$REGISTRY_PATH/tests/validate_devfile_schemas"

# Run the validation test with the single sample
ginkgo run --procs 1 \
  . -- -stacksPath "$SAMPLE_PATH" -stackDirs "."

echo "======================="
echo "Schema validation completed!"
echo "=======================" 