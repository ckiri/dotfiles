#!/bin/sh
#
# Sync the homewiki-html on homeserver

rsync \
	--verbose \
	--update \
	--recursive \
	--partial \
	--exclude='*.wiki' \
	~/docs/homewiki-html/* ~/docs/homewiki/* \
	homeserver:~/homewiki/homewiki-html
