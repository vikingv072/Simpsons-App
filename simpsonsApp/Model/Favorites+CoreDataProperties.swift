//
//  Favorites+CoreDataProperties.swift
//  simpsonsApp
//
//  Created by C02PX1DFFVH5 on 1/4/19.
//  Copyright © 2019 C02PX1DFFVH5. All rights reserved.
//
//

import Foundation
import CoreData


extension Favorites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorites> {
        return NSFetchRequest<Favorites>(entityName: "Favorites")
    }

    @NSManaged public var favFirstURL: String?
    @NSManaged public var favImage: NSData?
    @NSManaged public var favResult: String?
    @NSManaged public var favText: String?

}
