#!/bin/bash

################################################################################
# BSD 2-Clause License
# 
# Copyright (c) 2016, Marcin L. Wojcikowski <mlw.github@gmail.com>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
################################################################################



#############
## Install ##
#############

readonly SCRIPTS_DIR_PATH="${HOME}/.scripts"


if [ $# -ne 1 ]; then
        echo "Usage: install.sh <script_name>"
        echo -n "The <script_name> can be provided as \"all\", then all of the "
        echo "scripts will be installed in the \${HOME}/.scripts/ directory."
        exit 1
fi
script_name=$1

## Create scripts directory if it doesn't exist ##
if [ ! -e ${SCRIPTS_DIR_PATH} ]; then
        mkdir -p ${SCRIPTS_DIR_PATH}
fi

if [ "all" == ${script_name} ]; then
        find . -iname "*.sh" -not -iname "install.sh" -print0 | xargs -0 cp -t \
        ${SCRIPTS_DIR_PATH}/
        exit $?
fi

if ! [[ *".sh"* == ${script_name} ]]; then
        script_name="${script_name}.sh"
fi

cp ${script_name} ${SCRIPTS_DIR_PATH}/

exit $?
