#!/bin/bash

: '
create ad usernames from firstname and lastname
'

PROGRAM_PATH="${SCRIPTS_DIR}/reconnaissance/username-anarchy/.files/username-anarchy"

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FIRSTNAME_FIELD=$(form_item  "firstname" "firstname")
LASTNAME_FIELD=$(form_item  "lastname" "lastname")
FORMAT_FIELD=$(form_item  "format" "select" "format" "all" "all|first|firstlast|first.last|firstlast[8]|first[4]last[4]|firstl|f.last|flast|lfirst|l.first|lastf|last|last.f|last.first|FLast|first1|fl|fmlast|firstmiddlelast|fml|FL|FirstLast|First.Last|Last")

# Generate GUI form
generate_form "${FIRSTNAME_FIELD}" "${LASTNAME_FIELD}" "${FORMAT_FIELD}"

FIRSTNAME=${form_data["firstname"]}
LASTNAME=${form_data["lastname"]}
FORMAT=${form_data["format"]}

selected_format=""
if [[ "${FORMAT}" != "all" ]]; then
    selected_format="--select-format '${FORMAT}'"
fi

paste_command "${PROGRAM_PATH} '${FIRSTNAME}' '${LASTNAME}' ${selected_format}"
xdotool key Return
