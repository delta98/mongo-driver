import MongoKitten
import Fluent

extension Fluent.Query {
    var mongoKittenQuery: MongoKitten.Query? {
        guard filters.count != 0 else {
            return nil
        }

        var query: MongoKitten.Query?

        for filter in filters {
            let subquery = filter.mongoKittenFilter

            if let q = query {
                query = subquery && q
            } else {
                query = subquery
            }
        }

        return query
    }
}
