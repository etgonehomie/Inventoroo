//
//  BoilerplateUtilties.swift
//  Inventoroo
//
//  Created by Eric Tom on 1/29/21.
//

import UIKit

class BoilerplateUtilities {
    
    /// Replaces the use of a Main.storyboard
    static func createMainNavigationWindowScene(for scene: UIScene, with controller: UIViewController) -> UIWindow? {
        // Force the scene to be a window scene and add it to the window
        guard let windowScene: UIWindowScene = scene as? UIWindowScene else { return nil }
        let window = UIWindow(windowScene: windowScene)
        
        // Set the view controller to the scene and make it visible
        window.rootViewController = UINavigationController(rootViewController: controller)
        window.makeKeyAndVisible()
        return window
    }
}
