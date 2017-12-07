#!/usr/bin/env bash
cat $0
# CUDA_VISIBLE_DEVICES=1 \
python examples/GraphParser.py --mode FastLSTM --num_epochs 200 --batch_size 8 --hidden_size 300 --num_layers 3 \
 --pos_dim 100 --char_dim 50 --num_filters 100 --arc_space 400 --type_space 100 \
 --objective cross_entropy --learning_rate 0.02 --decay_rate 0.05 --schedule 1 --gamma 0.0 \
 --p_in 0.33 --p_rnn 0.33 0.33 --p_out 0.33 --unk_replace 0.5 \
 --decode mst \
 --word_embedding sskip --word_path "data/sskip/sskip.spa.64.gz" --char_embedding random \
 --punctuation 'Fa' 'Fc' 'Fd' 'Fe' 'Fg' 'Fh' 'Fi' 'Fp' 'Fs' 'Fx' 'Fz' \
 --train "data/conll2006/Spanish/spanish_cast3lb_train.conll" \
 --dev "data/conll2006/Spanish/spanish_cast3lb_dev.conll" \
 --test "data/conll2006/Spanish/spanish_cast3lb_test.conll" \
 --data_name "spanish_conll2006"
