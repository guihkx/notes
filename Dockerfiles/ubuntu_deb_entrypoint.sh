#!/usr/bin/env bash

# Note: This build script is meant to be used within the container image created by 'ubuntu-*' Dockerfiles.

set -euo pipefail

# Script options:
#
# -d <dir>: Set build directory (overrides $BUILD_DIR below).
# -t <type>: Set build type (overrides $BUILD_TYPE below).
# -p: Disable 'Pro' features (overrides $PRO_VERSION below).
# -u: Enable the update checker feature (overrides $UPDATE_CHECKER below).
# -n: Do not add the current git revision to the app's version (overrides $GIT_REVISION below).
# -c <options>: Options passed to CMake's configure stage (overrides $CMAKE_CONFIG_OPTIONS below).
# -b <options>: Options passed to CMake's build stage (overrides $CMAKE_BUILD_OPTIONS below).
# -o <options>: Options passed to CPack (overrides $CPACK_OPTIONS below).

# Hint: Pre-existing environment variables with the same name as the variables below will take precedence.
BUILD_DIR="${BUILD_DIR:-build}"
BUILD_TYPE="${BUILD_TYPE:-release}"
PRO_VERSION="${PRO_VERSION:-OFF}"
UPDATE_CHECKER="${UPDATE_CHECKER:-OFF}"
GIT_REVISION="${GIT_REVISION:-ON}"
CMAKE_INSTALL_PREFIX="${CMAKE_INSTALL_PREFIX:-/usr}"

SCRIPT_NAME="$(basename "${0}")"

function msg() {
  echo -e "\033[1m[${SCRIPT_NAME}] ${1}\033[0m"
}

while getopts 'd:t:punc:b:o:' OPTION; do
  case "${OPTION}" in
  d)
    msg "Note: Overriding build directory: '${BUILD_DIR}' -> '${OPTARG}'"
    BUILD_DIR="${OPTARG}"
    ;;
  t)
    msg "Note: Overriding build type: '${BUILD_TYPE}' -> '${OPTARG}'"
    BUILD_TYPE="${OPTARG}"
    ;;
  p)
    msg "Note: Disabling 'Pro' features."
    PRO_VERSION='OFF'
    ;;
  u)
    msg "Note: Enabling the update checker feature."
    UPDATE_CHECKER='ON'
    ;;
  n)
    msg "Note: Not adding git revision to the app's version."
    GIT_REVISION='OFF'
    ;;
  c)
    msg "Note: Overriding CMake configure options: '${CMAKE_CONFIG_OPTIONS}' -> '${OPTARG}'"
    CMAKE_CONFIG_OPTIONS="${OPTARG}"
    ;;
  b)
    msg "Note: Overriding CMake build options: '${CMAKE_BUILD_OPTIONS}' -> '${OPTARG}'"
    CMAKE_BUILD_OPTIONS="${OPTARG}"
    ;;
  o)
    msg "Note: Overriding CPack options: '${CPACK_OPTIONS}' -> '${OPTARG}'"
    CPACK_OPTIONS="${OPTARG}"
    ;;
  *) ;;
  esac
done

CMAKE_CONFIG_OPTIONS="${CMAKE_CONFIG_OPTIONS:---warn-uninitialized -B ${BUILD_DIR} -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DGIT_REVISION=${GIT_REVISION} -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DPRO_VERSION=${PRO_VERSION} -DUPDATE_CHECKER=${UPDATE_CHECKER}}"
CMAKE_BUILD_OPTIONS="${CMAKE_BUILD_OPTIONS:---build ${BUILD_DIR} --parallel $(nproc)}"
CPACK_OPTIONS="${CPACK_OPTIONS:--G DEB}"

set -x

msg 'Running CMake (configure)...'
# shellcheck disable=SC2086
cmake ${CMAKE_CONFIG_OPTIONS}

msg 'Running CMake (build)...'
# shellcheck disable=SC2086
cmake ${CMAKE_BUILD_OPTIONS}

msg 'Running CPack...'
# shellcheck disable=SC2086
(cd "${BUILD_DIR}" && cpack ${CPACK_OPTIONS})

msg 'Running lintian...'
lintian "${BUILD_DIR}"/*.deb

# Needed for GitHub Actions.
if [ -f /GITHUB_OUTPUT ]; then
  msg "Note: File '/GITHUB_OUTPUT' exists, assuming we're running on GitHub Actions."
  distro_id=$(grep -oPm1 '^ID="?\K[^"]+' /etc/os-release)
  distro_codename=$(grep -oPm1 '^VERSION_CODENAME="?\K[^"]+' /etc/os-release || echo '')
  echo "distro_name=${distro_id}${distro_codename:+-"$distro_codename"}" >>'/GITHUB_OUTPUT'

  if ! deb_path=$(find "${BUILD_DIR}" -maxdepth 1 -name '*.deb' -print -quit); then
    msg 'Fatal: Unable to find deb package'
    exit 1
  fi
  echo "deb_name=$(basename "${deb_path%.*}")" >>'/GITHUB_OUTPUT'
  echo "deb_path=${deb_path}" >>'/GITHUB_OUTPUT'
fi
