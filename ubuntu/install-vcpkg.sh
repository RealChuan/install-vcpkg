#!/bin/bash -e
################################################################################
##  File:  install-vcpkg.sh
##  Desc:  Install vcpkg
################################################################################

REPO_URL="$1"
BRANCH_NAME="$2"

# Set env variable for vcpkg
VCPKG_INSTALLATION_ROOT=/usr/local/share/vcpkg

if [ -d "$VCPKG_INSTALLATION_ROOT" ]; then
    echo "Removing existing VCPKG installation at $VCPKG_INSTALLATION_ROOT"
    rm -rf "$VCPKG_INSTALLATION_ROOT"
fi

# Install vcpkg
git clone --branch "${BRANCH_NAME}" "${REPO_URL}" ${VCPKG_INSTALLATION_ROOT}

$VCPKG_INSTALLATION_ROOT/bootstrap-vcpkg.sh

# workaround https://github.com/microsoft/vcpkg/issues/27786

mkdir -p /root/.vcpkg/ $HOME/.vcpkg
touch /root/.vcpkg/vcpkg.path.txt $HOME/.vcpkg/vcpkg.path.txt

$VCPKG_INSTALLATION_ROOT/vcpkg integrate install
chmod 0777 -R $VCPKG_INSTALLATION_ROOT
ln -sf $VCPKG_INSTALLATION_ROOT/vcpkg /usr/local/bin

rm -rf /root/.vcpkg $HOME/.vcpkg
