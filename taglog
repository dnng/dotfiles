#!/bin/bash
# taglog - A script to create a tag-changelog from scratch
#
# Author: Daniel Noguchi <danielnoguchi at gmail dot com>

# This sequence of commands gives us a list of tags on a branch, i.e a sequence
# of tags starting at the most recent tag and ends at the first tag of a commit
# on a branch.
# The --simplify-by-decoration option show commits that are referred by some
# branch or tag are selected, so we can find the tags.
#
# TODO: Process results that show more than one tag on the same commit (not sure
# if this is necessary, since the tags reference the same commit, so the
# changelog would be the same).

TAGS=$(git log --simplify-by-decoration --decorate --pretty=oneline | \
    egrep -o 'tag:[^,)]*' | \
    awk -F': ' '{ print $2 }')

if [ -z "${TAGS}" ]; then
    echo "There are no tags in this repository. Can't generate tag changelog"
    exit -1
fi

# Couldn't find a solution that does not use arrays, so the script is not
# portable, but its the first version so...
declare -a TAGS_LIST=(${TAGS})

NUM_OF_TAGS=${#TAGS_LIST[@]}
LAST_TAG=${TAGS_LIST[$((${NUM_OF_TAGS}-1))]}
LOG_FILE="changelog"

# Now the fun part:
make_log() {
    for i in $(seq ${NUM_OF_TAGS}) 
    do
            DATE=$(git log ${TAGS_LIST[$((i-1))]} -n 1 |\
                grep Date |\
                sed -e 's/Date:\s\+\(.\+\)\s-.*/\1/g')
            HEAD="\n\n${TAGS_LIST[$((i-1))]} / ${DATE} \n==============================\n\n"; 
            printf "$HEAD" >> ${LOG_FILE};
            # Are we at the last tag?
            CURRENT_TAG=${TAGS_LIST[$((i-1))]}
            if [ "${CURRENT_TAG}" = "${LAST_TAG}" ]; then
                git log --pretty=format:"%s [%cn]" ${TAGS_LIST[$((i-1))]} >> ${LOG_FILE}
            else
                # Since the list is ordered, we don't have to worry about the
                # sequence
                git log --pretty=format:"%s [%cn]" \
                    ${TAGS_LIST[$((i))]}..${TAGS_LIST[$((i-1))]} >> ${LOG_FILE}
            fi
    done
}

make_log
