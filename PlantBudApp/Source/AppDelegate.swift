//
//  AppDelegate.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 19/11/2022.
//

import UIKit
import Lottie
import LottieProgressHUD

let UIAppDelegate = UIApplication.shared.delegate as? AppDelegate

enum ApplicationState: Int {
    case normal, newInstall, update
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Public properties
    
    public lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    public var applicationCoordinator: ApplicationCoordinator?
    
    // MARK: - Private properties
    
    // MARK: - Initialization
    
    override init() {
        super.init()
        
    }
}

//MARK: - Lifecycle

extension AppDelegate {
    func application(_ application: UIApplication,
                     willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        if let progressAnimation = LottieAnimation.named("plant_walking")
        {
            ProgressHUD.register(animation: progressAnimation)
        }
        else
        {
            fatalError("Unable to find the animation file")
        }
        
        self.applicationCoordinator = ApplicationCoordinator(window: window)
        applicationCoordinator?.startEmpty()
        setupMainInterface()
        return true
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupNavigationBar()
        
        return true
    }
}

//MARK: - Setup

extension AppDelegate {
    private func setupMainInterface(
        //        tabBarOption: TabBarOption,
        completion: (() -> ())? = nil) {
            //        self.applicationCoordinator = ApplicationCoordinator(window: window)
            //        if UserContext.shared.loggedIn {
            //            applicationCoordinator?.startTabBarCoordinator(initiallySelectedOption: tabBarOption,
            //                                                           completion: completion)
            //        } else {
            //            applicationCoordinator?.startLoginCoordinator()//TODO: TU LOGIN WYŁACZYŁEŚ
            applicationCoordinator?.startTabBarCoordinator(initiallySelectedOption: .home)
            //        }
        }
    
    private func setupMainInterface() {
        //        if UserContext.shared.loggedIn {
        //            UserContext.shared.logout(loginSettings: loginSettings)
        //        } else {
        //            applicationCoordinator?.startLoginCoordinator()//TODO: TU LOGIN WYŁACZYŁEŚ
        applicationCoordinator?.startTabBarCoordinator(initiallySelectedOption: .home)
        //        }
    }
    
    private func setupNavigationBar() {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = Color.brandWhite
            appearance.titleTextAttributes = [
                .foregroundColor : Color.black,
                .font : Font.noticiaRegular(size: 20),
            ]
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().layer.shadowColor = Color.darkGray.cgColor
        UINavigationBar.appearance().layer.shadowOffset = CGSize(width: 0, height: 1)
        UINavigationBar.appearance().backgroundColor = .gray
        UINavigationBar.appearance().barTintColor = .gray
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : Color.black,
            NSAttributedString.Key.font : Font.noticiaRegular(size: 20)
        ]
    }
}

// MARK: - Showing / hiding loading indicator

extension AppDelegate {
    public func showLoadingIndicator(withDelay: Bool = false,
                                     delay: Double = 0.8) {
        NSObject.cancelPreviousPerformRequests(withTarget: self,
                                               selector: #selector(_showLoadingIndicator),
                                               object: nil)
        if withDelay {
            perform(#selector(_showLoadingIndicator), with: nil, afterDelay: delay)
        } else {
            _showLoadingIndicator()
        }
    }
    
    public func hideLoadingIndicator() {
        NSObject.cancelPreviousPerformRequests(withTarget: self,
                                               selector: #selector(_showLoadingIndicator),
                                               object: nil)
        ProgressHUD.dismiss()
    }
    
    @objc private func _showLoadingIndicator() {
        ProgressHUD.show(backgroundColor: Color.brandWhite)
    }
}

// MARK: - StoreReview
