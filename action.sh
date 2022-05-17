#!/usr/bin/env bash

set -eux

function test() {
	echo "Testing tag $tag"
	if git ls-remote --exit-code --tags origin "refs/tags/$tag" >/dev/null 2>&1; then
	  echo "::error ::tag $tag exists already"
	  exit 1
	fi
}

function set() {
	echo "Setting tag $tag"

	git config user.name github-actions
	git config user.email github-actions@github.com

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

case "$mode" in
  test)
    test
    ;;
  set)
    set
    ;;
   *)
   echo "::error ::Mode undefined, must be one of (test|set)"
   exit 1
   ;;
esac
