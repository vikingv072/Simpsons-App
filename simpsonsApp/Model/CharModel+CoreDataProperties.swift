//
//  CharModel+CoreDataProperties.swift
//  simpsonsApp
//
//  Created by C02PX1DFFVH5 on 12/13/18.
//  Copyright © 2018 C02PX1DFFVH5. All rights reserved.
//
//

import Foundation
import CoreData


extension CharModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CharModel> {
        return NSFetchRequest<CharModel>(entityName: "CharModel")
    }

    @NSManaged public var text: String?
    @NSManaged public var result: String?
    @NSManaged public var firstURL: String?
    @NSManaged public var image: NSData?

}
