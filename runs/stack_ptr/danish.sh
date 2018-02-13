#!/usr/bin/env bash
cat $0
export PYTHON="python2 -u"
CUDA_VISIBLE_DEVICES=2 $PYTHON examples/StackPointerParser.py --mode FastLSTM --num_epochs 1000 --batch_size 8 --decoder_input_size 256 --hidden_size 300 --encoder_layers 3 --decoder_layers 1 \
 --pos_dim 100 --char_dim 100 --num_filters 100 --arc_space 400 --type_space 128 \
 --opt adam --learning_rate 0.001 --decay_rate 0.75 --epsilon 1e-4 --schedule 10 --coverage 0.0 --gamma 0.0 --clip 5.0 \
 --p_in 0.33 --p_out 0.33 --p_rnn 0.33 0.33 --unk_replace 0.5 --label_smooth 1.0 --pos --beam 5 --prior_order inside_out \
 --grandPar --sibling \
  --word_embedding polyglot --word_path "data/polyglot/polyglot-da.pkl" --char_embedding random \
 --punctuation 'XP' \
 --train "data/conll2006/Danish/danish_ddt_train.conll" \
 --dev "data/conll2006/Danish/danish_ddt_dev.conll" \
 --test "data/conll2006/Danish/danish_ddt_test.conll" \
 --model_path "models/parsing/stack_ptr/danish/" --model_name 'network.pt.danish'
