#!/usr/bin/env bash
cat $0
export PYTHON="python2 -u"
CUDA_VISIBLE_DEVICES=1 $PYTHON examples/analyze.py --beam 10 --prior_order inside_out --ordered --gpu \
 --punctuation 'Punct' \
 --test "data/conll2006/Bulgarian/bulgarian_bultreebank_test.conll" \
 --model_path "models/parsing/stack_ptr/bulgarian_g/" --model_name 'network.pt.bulgarian_g'
