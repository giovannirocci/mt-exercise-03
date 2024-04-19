#! /bin/bash

scripts=$(dirname "$0")
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools
perplexity=$base/perplexity

mkdir -p $models

mkdir -p $perplexity

num_threads=4
device=""

SECONDS=0

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python3 main.py --data $data/frankenstein \
        --epochs 40 \
        --log-interval 100 \
        --emsize 200 --nhid 200 --dropout 0.1 --tied \
        --save $models/model_0.1_dropout.pt \
        --logfile $perplexity/stats_0.1_dropout.log
)

echo "time taken:"
echo "$SECONDS seconds"
