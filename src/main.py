import pandas as pd
import utm

DATASET_DIR = '../datasets/'

def load_dataset_csv(filename):
    return pd.read_csv(DATASET_DIR + filename + '.csv', sep=',', header=0)

def load_earthquakes():
    return load_dataset_csv('earthquakes')

# filter the dataset to include events from the year 1965 until 2016
def load_volcano_events():
    volcano_events = load_dataset_csv('volcano-events')
    return volcano_events.loc[(volcano_events['Year'] >= 1965) & (volcano_events['Year'] <= 2016)]

#extract the latitude and longitude from the datasets
def extract_earthquakes():
    earthquakes = load_earthquakes()
    latitude_array = earthquakes['Latitude'].to_numpy()
    longitude_array = earthquakes['Longitude'].to_numpy()
    return latitude_array, longitude_array

def extract_volcano():
    volcano_events = load_volcano_events()
    latitude_array = volcano_events['Latitude'].to_numpy()
    longitude_array = volcano_events['Longitude'].to_numpy()
    return latitude_array, longitude_array

# TODO: add fill_blanks function
def fill_blanks():
    pass

# TODO: convert lat and lon into UTM for the volcano_events
def convert_volcano():
    pass
    

# TODO: convert lat and lon into UTM for earthquakes
def convert_earthquakes():
    pass

def main():
    earthquakes = load_earthquakes()
    volcano_events = load_volcano_events()
    print(volcano_events)

if __name__ == "__main__":
    main()