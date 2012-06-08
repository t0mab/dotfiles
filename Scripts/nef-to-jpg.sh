#! /bin/sh

source_dir=$1
output_dir=$2

[ ! -d $output_dir ] && mkdir -p $output_dir
ufraw-batch $source_dir/*NEF --out-type=jpeg --out-path=$output_dir --exposure=auto
