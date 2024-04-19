#! /bin/bash

scripts=$(dirname "$0")
base=$scripts/..

data=$base/data

mkdir -p $data

tools=$base/tools

# link default training data for easier access

mkdir -p $data/wikitext-2

for corpus in train valid test; do
    absolute_path=$(realpath $tools/pytorch-examples/word_language_model/data/wikitext-2/$corpus.txt)
    ln -snf $absolute_path $data/wikitext-2/$corpus.txt
done

# download a different interesting data set!

mkdir -p $data/frankenstein

mkdir -p $data/frankenstein/raw

wget https://www.gutenberg.org/cache/epub/84/pg84.txt
mv pg84.txt $data/frankenstein/raw/tales.txt

# preprocess slightly

cat $data/frankenstein/raw/tales.txt | python3 $base/scripts/preprocess_raw.py > $data/frankenstein/raw/tales.cleaned.txt

# tokenize, fix vocabulary upper bound

cat $data/frankenstein/raw/tales.cleaned.txt | python3 $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" --sent-tokenize > \
    $data/frankenstein/raw/tales.preprocessed.txt

# split into train, valid and test

head -n 440 $data/frankenstein/raw/tales.preprocessed.txt | tail -n 400 > $data/frankenstein/valid.txt
head -n 840 $data/frankenstein/raw/tales.preprocessed.txt | tail -n 400 > $data/frankenstein/test.txt
tail -n 3075 $data/frankenstein/raw/tales.preprocessed.txt | head -n 2955 > $data/frankenstein/train.txt
