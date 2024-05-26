import dataset

def main():
    earthquake_events = dataset.load_earthquake_events()
    volcano_events = dataset.load_volcano_events()
    print(earthquake_events)
    print(volcano_events)

if __name__ == "__main__":
    main()