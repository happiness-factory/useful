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



#################
## Wakeup call ##
#################

readonly VOL_RISE_TIME=5 #[minutes]


amixer sset "Master" 10% -q

## Start server ##
mocp -S

## Play playlist ##
mocp -p

## Increase volume ##
readonly ONE_MINUTE_SEC=60
readonly NUMBER_OF_VOL_INCR_STEPS=9
for vol in 20 30 40 50 60 70 80 90 100
do
        sleep $[ VOL_RISE_TIME * ONE_MINUTE_SEC / NUMBER_OF_VOL_INCR_STEPS ]
        amixer sset "Master" ${vol}% -q
done

exit 0

