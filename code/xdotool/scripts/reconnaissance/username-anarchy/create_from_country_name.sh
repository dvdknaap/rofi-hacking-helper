#!/bin/bash

: '
create ad usernames from country name
'

PROGRAM_PATH="${SCRIPTS_DIR}/reconnaissance/username-anarchy/.files/username-anarchy"

# Generate GUI form items (label, type (optional: default text), name, default (optional))

COUNTRY_FIELD=$(form_item  "country" "select" "country" "us" "argentina|austria|belgium|canada|china|denmark|france|germany|hungary|india|ireland|italy|luxembourg|netherlands|newzealand|norway|poland|serbia|slovenia|spain|sweden|switzerland|uk|us")
FORMAT_FIELD=$(form_item  "format" "select" "format" "all" "all|first|firstlast|first.last|firstlast[8]|first[4]last[4]|firstl|f.last|flast|lfirst|l.first|lastf|last|last.f|last.first|FLast|first1|fl|fmlast|firstmiddlelast|fml|FL|FirstLast|First.Last|Last")

# Generate GUI form
generate_form "${COUNTRY_FIELD}" "${FORMAT_FIELD}"

COUNTRY=${form_data["country"]}
FORMAT=${form_data["format"]}

selected_format=""
if [[ "${FORMAT}" != "all" ]]; then
    selected_format="--select-format '${FORMAT}'"
fi

paste_command "${PROGRAM_PATH} --country '${COUNTRY}' ${selected_format}"
xdotool key Return
