from pandas import DataFrame

def hot_encoding(earthquakes: DataFrame, volcanic_eruptions: DataFrame):
    df = DataFrame({'Zone number': [], 'Zone letter': [], 'Earthquake': [], 
                    'Volcanic eruption': []})
    
    def contains_location(zone_number: int, zone_letter: str) -> bool:
        return ((df['Zone number'] == zone_number) & 
                (df['Zone letter'] == zone_letter)).any()

    for zone_number, zone_letter in zip(earthquakes['Zone number'], 
                                        earthquakes['Zone letter']):

        if not contains_location(zone_number, zone_letter):
            df = df._append({'Zone number': zone_number, 'Zone letter': zone_letter, 'Earthquake': 1, 
                    'Volcanic eruption': 0}, ignore_index=True)
    
    for zone_number, zone_letter in zip(volcanic_eruptions['Zone number'], 
                                        volcanic_eruptions['Zone letter']): 
        if not contains_location(zone_number, zone_letter):
            df = df._append({'Zone number': zone_number, 'Zone letter': zone_letter, 'Earthquake': 0, 
                    'Volcanic eruption': 1}, ignore_index=True)
        else:
            df.at[df.loc[(df['Zone number'] == zone_number) & (df['Zone letter'] == zone_letter)].index[0], 'Volcanic eruption'] = 1
    return df

# TODO: use mlxtend 
