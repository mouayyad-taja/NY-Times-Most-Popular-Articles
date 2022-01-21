//
//  ControllerManager.swift
//  NY-Times-Most-Popular-Articles
//
//  Created by Mouayyad Taja on 21/01/2022.
//

import Foundation
import SwifterSwift

//Contains objects of exist Controllers
struct ControllerManager {

    //Contains objects of exist storyboards
    struct myStoryboard {
        //main storyboard
        static let main = UIStoryboard.init(name: "Main", bundle: nil)
    }

    
    private static func viewController<T: UIViewController>(withClass name: T.Type, storyboard: UIStoryboard) -> T{
        if let vc = storyboard.instantiateViewController(withClass: T.self){
            return vc
        }
        fatalError("Couldn't find view controlller")
    }
    
    //collection of main controllers
    struct main {
        
        static var articleDetailVC : ArticleDetailVC {
            return viewController(withClass: ArticleDetailVC.self, storyboard: myStoryboard.main)
        }
    }
}

