import pandas as pd
import utm

DATASET_DIR = '../datasets/'

def load_dataset_csv(filename):
    return pd.read_csv(DATASET_DIR + filename + '.csv', sep=',', header=0)

def convert_to_utm(df: pd.DataFrame):
    zone_numbers = []
    zone_letters = []
    drop_rows = []
    for index, row in df.iterrows():
        try:
            ret = utm.from_latlon(row['Latitude'], row['Longitude'])
            zone_numbers.append(ret[2])
            zone_letters.append(ret[3])
        except:
            drop_rows.append(index)
    del df['Latitude']
    del df['Longitude']
    df = df.drop(drop_rows)
    df['Zone number'] = zone_numbers
    df['Zone letter'] = zone_letters
    return df

def load_earthquake_events():
    earthquake_events = load_dataset_csv('earthquakes')
    earthquake_events = convert_to_utm(earthquake_events)
    return earthquake_events

def load_volcano_events():
    volcano_events = load_dataset_csv('volcano-events')
    # filter the dataset to include events from the year 1965 until 2016
    volcano_events = volcano_events.loc[(volcano_events['Year'] >= 1965) & \
                                        (volcano_events['Year'] <= 2016)]
    volcano_events = convert_to_utm(volcano_events)
    return volcano_events

# TODO: add fill_blanks function
def fill_blanks():
    pass
