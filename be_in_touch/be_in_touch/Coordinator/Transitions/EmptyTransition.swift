//
//  EmptyTransition.swift
//  be_in_touch
//
//  Created by Nor1 on 18.05.2023.
//

import Foundation
import UIKit

class EmptyTransition : Transition {
    func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)?) {}
    
    func close(_ viewController: UIViewController, completion: (() -> Void)?) {}
}
