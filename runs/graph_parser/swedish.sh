#!/usr/bin/env bash
cat $0
# CUDA_VISIBLE_DEVICES=1 \
python examples/GraphParser.py --mode FastLSTM --num_epochs 200 --batch_size 32 --hidden_size 400 --num_layers 3 \
 --pos_dim 100 --char_dim 50 --num_filters 100 --arc_space 500 --type_space 100 \
 --objective cross_entropy --learning_rate 0.02 --decay_rate 0.05 --schedule 1 --gamma 0.0 \
 --p_in 0.33 --p_rnn 0.33 0.33 --p_out 0.33 --unk_replace 0.5 \
 --decode mst \
 --word_embedding polyglot --word_path "data/polyglot/polyglot-sv.pkl" --char_embedding random \
 --punctuation 'IP' 'IK' 'IR' 'IT' 'IC' 'IQ' 'IU' 'I?' \
 --train "data/conll2006/Swedish/swedish_talbanken05_train.conll" \
 --dev "data/conll2006/Swedish/swedish_talbanken05_dev.conll" \
 --test "data/conll2006/Swedish/swedish_talbanken05_test.conll" \
 --data_name "swedish_conll2006"
