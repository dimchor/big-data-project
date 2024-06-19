import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns

DATASET_DIR = '../datasets/'

#load data from a .csv file 
def load_dataset_csv(filename):
    return pd.read_csv(DATASET_DIR + filename + '.csv', sep=',', header=0)


def load_association():
    association_file = load_dataset_csv('association-file')
    #plt.figure(figsize=(12, 8))
    sns.countplot(data=association_file, x='Zone number', hue='Event')
    plt.title('title')
    plt.show()