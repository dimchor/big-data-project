import pandas as pd
import utm

DATASET_DIR = '../datasets/'

#load data from a .csv file 
def load_dataset_csv(filename):
    return pd.read_csv(DATASET_DIR + filename + '.csv', sep=',', header=0)


#converts Latitude and Longitude to the utm system
def convert_to_utm(df: pd.DataFrame):
    zone_numbers = []
    zone_letters = []
    drop_rows = [] #rows that are not possible to convert
    index = 0
    for lat, lon in zip(df['Latitude'], df['Longitude']):
        try:
            ret = utm.from_latlon(lat, lon)
            zone_numbers.append(ret[2])
            zone_letters.append(ret[3])
        except:
            drop_rows.append(index)
        index += 1
    # del df['Latitude']
    # del df['Longitude']
    df = df.drop(drop_rows)
    #adds the columns in the dataset
    df['Zone number'] = zone_numbers
    df['Zone letter'] = zone_letters
    return df

#removes types of movements that are not equal to "Earthquake" 
def remove_other_movements(df: pd.DataFrame):
    drop_rows = []
    index = 0
    for type in df['Type']:
        if type != 'Earthquake':
            drop_rows.append(index)
        index += 1
    return df.drop(drop_rows)


def load_earthquake_events():
    #loads the earthquakes dataset
    earthquake_events = load_dataset_csv('earthquakes')
    earthquake_events = remove_other_movements(earthquake_events)
    #convert to utm for earthquakes coordinates 
    earthquake_events = convert_to_utm(earthquake_events)
    return earthquake_events

def load_volcano_events():
    volcano_events = load_dataset_csv('volcano-events')
    # filter the dataset to include events from the year 1965 until 2016
    volcano_events = volcano_events.loc[(volcano_events['Year'] >= 1965) & \
                                        (volcano_events['Year'] <= 2016)]
    #convert to utm for volcano coordinates 
    volcano_events = convert_to_utm(volcano_events)
    return volcano_events

