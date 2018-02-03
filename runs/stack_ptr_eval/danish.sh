#!/usr/bin/env bash
cat $0
export PYTHON="python2 -u"
CUDA_VISIBLE_DEVICES=1 $PYTHON examples/analyze.py --beam 10 --prior_order inside_out --ordered --gpu \
 --punctuation 'XP' \
 --test "data/conll2006/Danish/danish_ddt_test.conll" \
 --model_path "models/parsing/stack_ptr/danish/" --model_name 'network.pt.danish'
