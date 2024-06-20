import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns

DATASET_DIR = '../datasets/'

#load data from a .csv file 
def load_dataset_csv(filename):
    return pd.read_csv(DATASET_DIR + filename + '.csv', sep=',', header=0)


def load_association():
    association_file = load_dataset_csv('association-file')
    sns.scatterplot(data=association_file, x='Zone number', y='Zone letter')
    plt.title('Scatter Plot of Earthquakes and Volcanic Eruptions by Zone')
    plt.xlabel('Zone Number')
    plt.ylabel('Zone Letter')
    
    plt.show()

    