from pandas import DataFrame
import mlxtend.frequent_patterns as fp

def hot_encoding(earthquakes: DataFrame, volcanic_eruptions: DataFrame):
    df = DataFrame({'Zone number': [], 'Zone letter': [], 'Earthquake': [], 
                    'Volcanic eruption': []})
    
    #returns true if there is a row which is equal to both zone_number and zone_letter
    def contains_location(zone_number: int, zone_letter: str) -> bool:
        return ((df['Zone number'] == zone_number) & 
                (df['Zone letter'] == zone_letter)).any()

    for zone_number, zone_letter in zip(earthquakes['Zone number'], 
                                        earthquakes['Zone letter']):

        if not contains_location(zone_number, zone_letter):
            df = df._append({'Zone number': zone_number, 'Zone letter': zone_letter, 'Earthquake': 1, 
                    'Volcanic eruption': 0}, ignore_index=1)
    
    #returns true if there is a row which is equal to both zone_number and zone_letter
    for zone_number, zone_letter in zip(volcanic_eruptions['Zone number'], 
                                        volcanic_eruptions['Zone letter']): 
        if not contains_location(zone_number, zone_letter):
            df = df._append({'Zone number': zone_number, 'Zone letter': zone_letter, 'Earthquake': 0, 
                    'Volcanic eruption': 1}, ignore_index=1)
        else:
            df.at[df.loc[(df['Zone number'] == zone_number) & (df['Zone letter'] == zone_letter)].index[0], 'Volcanic eruption'] = 1
    return df

def apriori(df: DataFrame):
    return fp.apriori(df, min_support = 0.1, use_colnames = 1, verbose = 1)

def association_rules(df: DataFrame):
    return fp.association_rules(df, metric = "confidence", min_threshold = 0.6)

# TODO: use mlxtend 
