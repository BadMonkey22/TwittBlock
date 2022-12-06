#!/bin/sh

#  versioning.sh
#  GYST Timelines
#
#  Created by Bad Monkey on 10/22/22.
#  

# The purpose of this script is to increase build number consistently in all targets
cd "$SRCROOT/Build"

# We change the value of "BUILD_NUMBER' in Config.xcconfig to the current date
# Explanation: https://stackoverflow.com/a/5955623/511878

# sed -i -e "/BUILD_NUMBER =/ s/= .*/= $(date +"%Y%m%d%H%M%S")/" Config.xcconfig
sed -i -e "/BUILD_NUMBER =/ s/= .*/= $(date +"%Y.%m.%d")/" Config.xcconfig

# Delete temp file
rm Config.xcconfig-e

exit 0

