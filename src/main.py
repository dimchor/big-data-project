import dataset
import association
import plot

def main():
    earthquake_events = dataset.load_earthquake_events()
    volcano_events = dataset.load_volcano_events()
    # print(earthquake_events)
    # print(volcano_events)
    df = association.hot_encoding(earthquake_events, volcano_events)
    # print(df.to_string())
    df = association.apriori(df[['Earthquake', 'Volcanic eruption']])
    print(df)
    print(association.association_rules(df))
    
    #df= plot.load_association()
    

if __name__ == "__main__":
    main()