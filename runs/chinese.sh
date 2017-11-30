#!/usr/bin/env bash
cat runs/chinese.sh
CUDA_VISIBLE_DEVICES=1 \
python examples/GraphParser.py --mode FastLSTM --num_epochs 200 --batch_size 32 --hidden_size 400 --num_layers 3 \
 --pos_dim 100 --char_dim 50 --num_filters 100 --arc_space 500 --type_space 100 \
 --objective cross_entropy --learning_rate 0.02 --decay_rate 0.05 --schedule 1 --gamma 0.0 \
 --p_in 0.33 --p_rnn 0.33 0.33 --p_out 0.33 --unk_replace 0.5 \
 --decode mst \
 --word_embedding sskip --word_path "data/sskip/sskip.chn.50.gz" --char_embedding polyglot --char_path "data/polyglot/polyglot-zh_char.pkl" \
 --punctuation 'G' 'X' \
 --train "data/conll2006/Chinese/chinese_sinica_train.conll" \
 --dev "data/conll2006/Chinese/chinese_sinica_dev.conll" \
 --test "data/conll2006/Chinese/chinese_sinica_test.conll" \
 --data_name "chinese_conll2006"
