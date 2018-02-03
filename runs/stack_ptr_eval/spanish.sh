#!/usr/bin/env bash
cat $0
export PYTHON="python2 -u"
CUDA_VISIBLE_DEVICES=1 $PYTHON examples/analyze.py --beam 10 --prior_order inside_out --ordered --gpu \
 --punctuation 'Fa' 'Fc' 'Fd' 'Fe' 'Fg' 'Fh' 'Fi' 'Fp' 'Fs' 'Fx' 'Fz' \
 --test "data/conll2006/Spanish/spanish_cast3lb_test.conll" \
 --model_path "models/parsing/stack_ptr/spanish/" --model_name 'network.pt.spanish'
