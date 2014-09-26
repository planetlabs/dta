#!/bin/bash

mkdir -p binaries
pushd binaries

tail -n +$(awk '/^__START_OF_TARFILE__/ { print NR + 1; exit 0; }' ../DtapiService/DtapiService.bin) ../DtapiService/DtapiService.bin | tar zfxv -

mv -f DtapiService32 DtapiServiced
rm -f DtapiService64

popd
