#!/bin/bash
# change the value of NMLC to reference your own nmlc installation
NMLC="pyrun $HOME/Downloads/openttd/nml-0.4.5/nmlc"
./clean.sh
mkdir wannaroo-tourist-set
gcc -C -E -nostdinc -x c-header wannaroo-tourist-set.pnml > wannaroo-tourist-set.nml
$NMLC -c -p DEFAULT --clear-orphaned wannaroo-tourist-set.nml
if [ $? -eq 0 ]
then
    cp wannaroo-tourist-set.nml generated
    cp wannaroo-tourist-set.grf wannaroo-tourist-set
    cp README.md wannaroo-tourist-set/readme.txt
    cp LICENSE wannaroo-tourist-set/license.txt
    cp changelog.txt wannaroo-tourist-set
    tar cvf wannaroo-tourist-set.tar wannaroo-tourist-set
    cp -i wannaroo-tourist-set.tar $HOME/.openttd/newgrf
    #cp -i wannaroo-tourist-set.grf $HOME/.openttd/newgrf
else
    echo "nmlc could not build newgrf"
fi

