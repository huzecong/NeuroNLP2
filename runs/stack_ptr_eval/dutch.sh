#!/usr/bin/env bash
cat $0
export PYTHON="python2 -u"
CUDA_VISIBLE_DEVICES=1 $PYTHON examples/analyze.py --beam 10 --prior_order inside_out --ordered --gpu \
 --punctuation 'Punc' \
 --test "data/conll2006/Dutch/dutch_alpino_test.conll" \
 --model_path "models/parsing/stack_ptr/dutch/" --model_name 'network.pt.dutch'
