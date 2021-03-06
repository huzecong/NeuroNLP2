#!/usr/bin/env bash
cat $0
export PYTHON="python2 -u"
CUDA_VISIBLE_DEVICES=1 $PYTHON examples/analyze.py --beam 10 --prior_order inside_out --ordered --gpu \
 --punctuation 'IP' 'IK' 'IR' 'IT' 'IC' 'IQ' 'IU' 'I?' \
 --test "data/conll2006/Swedish/swedish_talbanken05_test.conll" \
 --model_path "models/parsing/stack_ptr/swedish/" --model_name 'network.pt.swedish'
