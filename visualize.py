import pandas as pd
import matplotlib.pyplot as plt

# Read and process each log file
dfs = []
dropout_values = [0, 0.1, 0.3, 0.6, 0.9]

for dropout in dropout_values:
    filename = f'perplexity/stats_{dropout}_dropout.log'
    df = pd.read_csv(filename, sep=',', header=0)
    df.columns = df.columns.str.strip() # Remove leading/trailing whitespaces
    df = df.drop(columns=['test perplexity'])
    df = df.drop(40)  # Remove the last row
    df['dropout'] = dropout
    dfs.append(df)

df = pd.concat(dfs)

# create tables with training and valid perplexity entries by epoch and dropout
training_df = df.pivot(index='epoch', columns='dropout', values='training perplexity')
valid_df = df.pivot(index='epoch', columns='dropout', values='valid perplexity')

training_df.plot(kind='line')
plt.xlabel('Epochs')
plt.ylabel('Training Perplexity')
plt.legend(title='Model Dropout Percentage')
plt.grid(True)
plt.show()

valid_df.plot(kind='line')
plt.xlabel('Epochs')
plt.ylabel('Validation Perplexity')
plt.legend(title='Model Dropout Percentage')
plt.grid(True)
plt.show()
