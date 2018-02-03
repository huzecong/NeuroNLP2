#!/usr/bin/env bash
cat $0
export PYTHON="python2 -u"
CUDA_VISIBLE_DEVICES=1 $PYTHON examples/analyze.py --beam 10 --prior_order inside_out --ordered --gpu \
 --punctuation '$.' '$,' '$(' \
 --test "data/conll2006/German/german_tiger_test.conll" \
 --model_path "models/parsing/stack_ptr/german/" --model_name 'network.pt.german'
