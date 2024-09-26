# Big Data project
In this assignment, assiciation rules are used to determine the relationship between earthquakes and volcanic eruptions. 

The following datasets were used from kaggle:
- https://www.kaggle.com/datasets/usgs/earthquake-database
- https://www.kaggle.com/datasets/rupindersinghrana/database-of-volcanic-eruptions

Coordinates from the datasets are converted to UTM in order to make it easier to find similar locations. Then, similar UTMs from the earthquake dataset and the volcanic eruptions dataset are compared in order to find possible associations using the apriori algorithm. 

There's a detailed report under the `report` directory that explains everything in detail (Greek).
