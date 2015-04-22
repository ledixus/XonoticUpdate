#!/bin/bash

#Copyright (c) <2015>, <Stefan Dietrich>
#All rights reserved.

#Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
#1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
#2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

#THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


###PATHS
###SSD means "Server Script Directory"
DATE=$(date +%Y-%m-%d-%H%M%S)
SRCDIR="/home/USER/src"
XONDIR="${SRCDIR}/xonotic"
LOGDIR="${SRCDIR}/log"
LOGFILE="${LOGDIR}/update-${DATE}.log"
SSD="${SRCDIR}/Xonotic-EAC-Scripts/server"
EMAIL="YOUREMAIL"

exec >> ${LOGFILE} 2>&1

CheckLogDir()

{
if [[ ! -d "${LOGDIR}" ]]; then mkdir -p "${LOGDIR}"
fi
}

XonUpdate()

{
cd "${XONDIR}" && ./all update && ./all compile dedicated
}

ModpackUpdate()
###Just on Friday

{
if [[ $(date +%u) = 5 ]]
	then cd "${SSD}" && ./server download-modpack && ./server mod build esk
fi
}

MailReport()

{
mutt -s "Logfile for Xonserver and Modpack Update" "${EMAIL}" < "${LOGFILE}"
}

LogfileDelete()
###Delete Logfiles which are older than 14 days

{
find "${LOGDIR}" -name "*.log -mtime +14 -delete"
}


Main()
{
CheckLogDir
XonUpdate
ModpackUpdate
MailReport
LogFileDelete
}
Main
