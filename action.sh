#!/usr/bin/env bash

[ "${RUNNER_DEBUG}" == 1 ] && set -xv
set -u

function does_tag_exist() {
  local tag="$1"
  echo "Testing tag $tag"

  if git ls-remote --exit-code --tags origin "refs/tags/$tag" >/dev/null 2>&1; then
    echo "::error ::tag $tag exists already"
    exit 1
  fi
}

function set_tag() {
  local tag="$1"
  echo "Setting tag $tag"

  git config user.name "${GITHUB_ACTOR}"
  git config user.email "${GITHUB_ACTOR}@github.com"

  version="${tag%%-*}"
  preversion="${tag##*-}"
  if [ "$version" != "$preversion" ]; then
    prefix="${version}-"
    tag="$preversion"
  fi

  tags=()
  before=''
  until [ "$before" = "$tag" ]; do
    tags+=("${prefix:-}${tag}")
    git tag "${tags[-1]}"
    before="$tag"
    tag="${tag%.*}"
  done

  # ensure this tag doesn't exist
  git push origin "${tags[0]}"
  # move all other tags
  git push origin --force "${tags[@]:1}"
}

if [ $# -ne 2 ]; then
  echo "::error ::Expected arguments: (test|set) <tag>"
  exit 1
fi

case "$1" in
test)
  does_tag_exist "$2"
  ;;
set)
  set_tag "$2"
  ;;
*)
  echo "::error ::Mode $1 undefined, must be one of (test|set)"
  exit 1
  ;;
esac
