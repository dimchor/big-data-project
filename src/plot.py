import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns

DATASET_DIR = '../datasets/'

#load data from a .csv file 



def load_association():
    #load data from the .csv file V
    association_file = pd.read_csv(DATASET_DIR + 'association-file' + '.csv', sep=',', header=0)

    if 'Event type' not in association_file.columns:
        # add the events in one column
        association_file['Event type'] = association_file.apply(
            lambda row: 'Earthquake' if row['Earthquake'] == 1 else 'Volcanic eruption', axis=1
        )

    # Create scatter plot with differed colors
    sns.scatterplot(data=association_file, x='Zone number', y='Zone letter', hue='Event type')

    plt.title('Scatter Plot of Earthquakes and Volcanic Eruptions by Zone')
    plt.xlabel('Zone Number')
    plt.ylabel('Zone Letter')

    plt.show()


    