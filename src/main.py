import pandas as pd
import utm

DATASET_DIR = '../datasets/'

def load_dataset_csv(filename):
    return pd.read_csv(DATASET_DIR + filename + '.csv', sep=',', header=0)

def load_earthquakes():
    return load_dataset_csv('earthquakes')

def load_volcano_events():
    volcano_events = load_dataset_csv('volcano-events')
    return volcano_events.loc[volcano_events['Year'].eq(1965).idxmax():]

# TODO: add fill_blanks function
def fill_blanks():
    pass

# TODO: convert lat and lon into UTM

def main():
    earthquakes = load_earthquakes()
    volcano_events = load_volcano_events()
    
    print(volcano_events)

if __name__ == "__main__":
    main()