# MT Exercise 3: Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model). Thanks to Emma van den Bold, the original author of these scripts. 

## Students names & IDs:

Giovanni Rocci (22-729-156)

Siro Rosenau (22-711-840)

# Changes made to the shell scripts for part 1

We used the Ubuntu terminal to run all shell scripts except for the install_packages.sh, because the "tools" folder for some reason was being created empty,
we used Powershell to run install_packages.sh.

- install_packages.sh:
  - We changed `pip` to `pip3` (Line 11)
  

- download_data.sh:
  - Line 27: We changed the link to our novel.
  - Lines 23, 25, 28, 32, 36, 37, 41, 42 and 43: We changed the directory name from "grimm" to "frankenstein"
  - Lines 32 and 36: We changed `python` to `python3`


- train.sh:
  - Line 18: We changed `python` to `python3` and adjusted the directory path from "grimm" to "frankenstein"


- generate.sh:
  - Line 17: We changed `python` to `python3`
  - Line 18: We adjusted the directory path from "grimm" to "frankenstein"

# Changes made to the shell scripts for part 2:

- generate.sh:
  - Lines 20 and 21: We changed the model to be used for the sample generation and the output file name

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps

Clone this repository in the desired place:

    git clone https://github.com/moritz-steiner/mt-exercise-03
    cd mt-exercise-03

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install required software:

    ./scripts/install_packages.sh

Download and preprocess data:

    ./scripts/download_data.sh

Train a model:

    ./scripts/train.sh

The training process can be interrupted at any time, and the best checkpoint will always be saved.

Generate (sample) some text from a trained model with:

    ./scripts/generate.sh


