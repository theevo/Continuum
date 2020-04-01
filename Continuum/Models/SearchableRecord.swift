//
//  SearchableRecord.swift
//  Continuum
//
//  Created by Theo Vora on 4/1/20.
//  Copyright © 2020 studio awaken. All rights reserved.
//

import Foundation

protocol SearchableRecord {
    func matchesSearchTerm(searchTerm: String) -> Bool
}
