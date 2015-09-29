#!/bin/bash

mkdir -p binaries
pushd binaries

tail -n +$(awk '/^__START_OF_TARFILE__/ { print NR + 1; exit 0; }' ../DtapiService/DtapiService.bin) ../DtapiService/DtapiService.bin | tar zfxv -

rm -f DtInfoCL

wget -q http://www.dektec.com/Products/Apps/DtInfoCL/Downloads/DtInfoCL.zip
unzip DtInfoCL.zip DtInfoCL/Linux/DtInfoCL.tar.gz
mkdir temp
tar zfxv DtInfoCL/Linux/DtInfoCL.tar.gz -C temp
rm -rf DtInfoCL*
mv temp/* .
mv DtInfoCL DtInfoCL32
rmdir temp

ls -al 

popd
