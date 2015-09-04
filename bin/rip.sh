#!/bin/bash
url=$(curl -s -F image=@"$1" s.idied.rip)
echo $url
