# Diffable data source (TableView and Collection view examples) 🍏

At WWDC 2019 Apple announced a couple of really cool features for table views and collection views. One of these cool features comes in the form of UITableViewDiffableDataSource and its counterpart UICollectionViewDiffableDataSource. These new diffable data source classes allow us to define data sources for collection- and table views in terms of snapshots that represent the current state of the underlying models. The diffable data source will then compare the new snapshot to the old snapshot and it will automatically apply any insertions, deletions, and reordering of its contents.






## Apple Developer documentation:

### UITableViewDiffableDataSource
https://developer.apple.com/documentation/uikit/uitableviewdiffabledatasource

##
### UICollectionViewDiffableDataSource
https://developer.apple.com/documentation/uikit/uicollectionviewdiffabledatasource
