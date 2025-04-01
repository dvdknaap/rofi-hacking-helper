#!/bin/bash

: '
create ad usernames from input file
'

PROGRAM_PATH="${SCRIPTS_DIR}/reconnaissance/username-anarchy/.files/username-anarchy"

# Generate GUI form items (label, type (optional: default text), name, default (optional))
USERS_FILE_FIELD=$(form_item  "users file" "users_file")
FORMAT_FIELD=$(form_item  "format" "select" "format" "all" "all|first|firstlast|first.last|firstlast[8]|first[4]last[4]|firstl|f.last|flast|lfirst|l.first|lastf|last|last.f|last.first|FLast|first1|fl|fmlast|firstmiddlelast|fml|FL|FirstLast|First.Last|Last")

# Generate GUI form
generate_form "${USERS_FILE_FIELD}" "${FORMAT_FIELD}"

USERS_FILE=${form_data["users_file"]}
FORMAT=${form_data["format"]}

selected_format=""
if [[ "${FORMAT}" != "all" ]]; then
    selected_format="--select-format '${FORMAT}'"
fi

paste_command "${PROGRAM_PATH} -input-file '${USERS_FILE}' ${selected_format}"
xdotool key Return
