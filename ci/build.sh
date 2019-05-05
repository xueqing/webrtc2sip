#!/bin/bash

function echoLog()
{
    redcolor='\033[31m'
    cleancolor='\033[0m'
    bluecolor='\033[34m'
    if [ $1 == 'error' ]
    then
        echo -e "error: $redcolor$2$cleancolor"
    else
        echo -e "info : $bluecolor$2$cleancolor"
    fi
}

## pre-process self-defined variables
test -z $buildVersion && buildVersion=debug
curTime=`date +%T`
test -z $timeZone && timeZone=UTC-8

echoLog info "********************************build"

echoLog info "********************************generate makefile"
export INSTALL_PATH=$CI_PROJECT_DIR/$INSTALL_PATH
qmake $CI_PROJECT_DIR/$serviceName.pro -r -spec linux-g++ CONFIG+=CI-TEST CONFIG+=$buildVersion

echoLog info "********************************build $serviceName, make"
threadnum=(8)
while :
do
    if [ $threadnum = 1 ] ; then make ; else make -j$threadnum ; fi
    if [ $? == 0 ] ; then break ; fi
    if [ $threadnum = 1 ] ; then exit 1 ; fi
    if [ $threadnum \> 1 ] ; then threadnum=$(($threadnum / 2)) ; fi
    echoLog error "make error [threadnum=$threadnum]."
done

echoLog info "********************************install $serviceName, make install"
make install

echoLog info "********************************build $serviceName , complete"
