#!/usr/bin/env bash

WD="$(dirname "$(readlink -f $0)")"
LAST_RACE="$(ls -t "$WD/content/race/" | head -1)"
LAST_SUNDAY="${LAST_RACE%.*}"
THIS_SUNDAY="$(date -d "this Sunday" +'%F')"
THIS_RACE="${THIS_SUNDAY}.md"
if [ ! -f "${WD}/content/race/${THIS_RACE}" ]; then
  car_by="$(awk '/tune_by/{print $2}' "${WD}/content/race/${LAST_RACE}")"
  sed -Ee 's/(^ {4}[a-z_]+:) .*/\1/' "${WD}/content/race/${LAST_RACE}" |\
    sed -Ee 's/(car_image:).*/\1 '"$THIS_SUNDAY"'-car.png/' |\
    sed -Ee 's/(car_by:).*/\1 '"$car_by"'/' |\
    tee "${WD}/content/race/${THIS_RACE}"
  # cp "${WD}/content/race/${LAST_RACE}" "${WD}/content/race/${THIS_RACE}"
  sed -i 's/'"$LAST_SUNDAY"'/'"$THIS_SUNDAY"'/' "${WD}/content/race/${THIS_RACE}"
  echo "Next race file created: ${WD}/content/race/${THIS_RACE}"

  cd "$WD"
  [ "$(git branch --show-current)" = "main" ] || git switch main
  git pull
  git checkout -b "$THIS_SUNDAY"
else
  echo "Next race file exists"
fi
code "${WD}/content/race/${THIS_RACE}"
