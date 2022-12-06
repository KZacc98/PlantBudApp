//
//  HomeCoordinator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 27/11/2022.
//

import UIKit

final class HomeCoordinator: TabBarItemCoordinator {
    
    // MARK: - Private properties
    
    private let viewControllerFactory: HomeViewControllerFactory
    //    private let user: UserPanelDomain?
    //    private var sideMenuData = SideMenuData()
    //
    //    private lazy var sideMenuSettings: SideMenuSettings = {
    //        var settings: SideMenuSettings = SideMenuSettings()
    //        settings.presentationStyle = SideMenuPresentationStyle.menuSlideIn
    //        settings.statusBarEndAlpha = 0
    //        settings.menuWidth = UIScreen.main.bounds.width * 0.75
    //        settings.presentationStyle.presentingEndAlpha = 0.5
    //
    //        return settings
    //    }()
    
    // MARK: - Initialization
    
    init(tabBarItem: UITabBarItem,
         viewControllerFactory: HomeViewControllerFactory = HomeViewControllerFactory()
         //         user: UserPanelDomain? = nil
    ) {
        
        self.viewControllerFactory = viewControllerFactory
        //        self.user = user
        super.init(tabBarItem: tabBarItem)
    }
    
    // MARK: - Start
    
    override func start(animated: Bool = false, completion: (() -> ())? = nil) {
        guard isStarted == false else { return }
        routeMenu(animated: animated)
//        setupNavigationController()
        super.start()
    }
    
    // MARK: - Public methods
    
    //    public func pushDiscountDetails(discount: NewsDomain) {
    //        let viewController = viewControllerFactory.makeDiscountDetailsViewController(discount: discount)
    //
    //        navigationController?.pushViewController(viewController, animated: true)
    //    }
    
    // MARK: - Private methods
    
//    private func setupNavigationController() {
//        navigationController?.delegate = self
//    }
    
        private func routeMenu(animated: Bool) {
            let viewController = viewControllerFactory.makeHomeMenuViewController()
            navigationController?.setViewControllers([viewController], animated: animated)
//            #warning("TODO: - Fix lag on startup")
//            setupSideMenuGestures()
//            bindSideMenuViewController()
//
//            viewController.onOrdersDisabled = { [weak self] in
//                self?.presentOrdersDisabled()
//            }
//
//            viewController.viewModel.onUserButtonPressed = { [weak self] userPanel in
//                self?.presentUserSideMenuIn(viewController)
//            }
//
//            viewController.viewModel.didSelectMenuOption = { [weak self] option, ordersListDelegate, orderId, orderDietId in
//                let tabBarCoordinator = UIAppDelegate?.applicationCoordinator?.childCoordinator as? TabBarCoordinator
//
//                switch option {
//                case .orderExtend:
//                    if let ordersDisabled = UserContext.shared.userPanel?.company.continueOrdersDisabled, ordersDisabled == true {
//                        self?.presentOrdersDisabled()
//                    } else {
//                        self?.startMyDietOrdersCoordinator(myDietOrdersOption: .newOrder, ordersListDelegate: ordersListDelegate)
//                    }
//                case .rateMeals:
//                    tabBarCoordinator?.selectTabBarItem(for: .menu)
//                case .contact:
//                    self?.pushContact()
//                case .changeAddress:
//                    self?.startMyDietOrdersCoordinator(orderId: orderId,
//                                                       orderDietId: orderDietId,
//                                                       myDietOrdersOption: .changeAddress)
//                case .cancelDelivery:
//                    self?.startMyDietOrdersCoordinator(orderId: orderId,
//                                                       orderDietId: orderDietId,
//                                                       myDietOrdersOption: .changeDeliveryDay)
//                case .rewards:
//                    self?.pushRewardList(delegate: ordersListDelegate)
//                case .recommendations:
//                    self?.pushReferrals()
//                default:
//                    return
//                }
            }
    //
    //        viewController.viewModel.didSelectDiet = { [weak self] orderId, orderDietId, delegate in
    //            self?.startMyDietOrdersCoordinator(orderId: orderId,
    //                                               orderDietId: orderDietId,
    //                                               myDietOrdersOption: .dietDetails,
    //                                               ordersListDelegate: delegate)
    //        }
    //
    //        viewController.viewModel.onDiscountTapped = { [weak self] discount in
    //            self?.pushDiscountDetails(discount: discount)
    //        }
    //
    //        viewController.viewModel.onLoyaltyProgramPressed = { [weak self] in
    //            self?.pushLoyaltyProgram()
    //        }
    //
    //        viewController.viewModel.onSelectUserForExclusion = { [weak self] in
    //            self?.pushUserList()
    //        }
    //
    //        viewController.viewModel.onExclusionsPressed = { [weak self] person in
    //            self?.pushExclusions(person: person)
    //        }
    //
    //        navigationController?.setViewControllers([viewController], animated: animated)
    //    }
    
    //    private func setupSideMenuGestures() {
    //        sideMenuData.sideMenuViewController = viewControllerFactory.makeUserSideMenuViewController()
    //        sideMenuData.sideMenuNavigationController = viewControllerFactory
    //            .makeSideMenuNavigationController(viewController: sideMenuData.sideMenuViewController,
    //                                              settings: sideMenuSettings)
    //        guard let navigationController = self.navigationController else { return }
    //        sideMenuData.sideMenuManager.rightMenuNavigationController = sideMenuData.sideMenuNavigationController
    //        sideMenuData.panGesture = sideMenuData.sideMenuManager.addPanGestureToPresent(toView: navigationController.navigationBar)
    //        sideMenuData.edgePanGesture = sideMenuData.sideMenuManager.addScreenEdgePanGesturesToPresent(toView: navigationController.view, forMenu: .right)
    //    }
    //
    //    private func presentUserSideMenuIn(_ myDietMenuViewController: MyDietMenuViewController?) {
    //        guard let sideViewController = sideMenuData.sideMenuNavigationController else { return }
    //
    //        myDietMenuViewController?.present(sideViewController, animated: true, completion: nil)
    //    }
    //
    //    private func bindSideMenuViewController() {
    //        let viewController = sideMenuData.sideMenuViewController
    //
    //        viewController.onOptionSelect = { [weak self, weak viewController] option in
    //            switch option {
    //            case .userData:
    //                viewController?.dismiss(animated: false) {
    //                    self?.pushUserProfile()
    //                }
    //            case .changePassword:
    //                viewController?.dismiss(animated: false) {
    //                    self?.pushChangePassword()
    //                }
    //            case .address:
    //                viewController?.dismiss(animated: false) {
    //                    self?.presentDeliveryAddressList()
    //                }
    //            case .exclusions:
    //                return
    //            case .orders:
    //                viewController?.dismiss(animated: false, completion: {
    //                    (UIAppDelegate?.applicationCoordinator?.childCoordinator as? TabBarCoordinator)?.selectTabBarItem(for: .orders)
    //                })
    //            case .loyalty:
    //                viewController?.dismiss(animated: false) {
    //                    self?.pushLoyaltyProgram()
    //                }
    //            case .logout:
    //                UserContext.shared.logout()
    //            }
    //        }
    //
    //        viewController.viewModel.onShowUserList = { [weak self] in
    //            viewController.dismiss(animated: false) {
    //                self?.pushUserList()
    //            }
    //        }
    //
    //        viewController.viewModel.onExclusionsPressed = { [weak self] person in
    //            viewController.dismiss(animated: false) {
    //                self?.pushExclusions(person: person)
    //            }
    //        }
    //    }
    //
    //    private func presentDeliveryAddressList() {
    //        let viewController = viewControllerFactory.makeDeliveryAddressListViewController()
    //
    //        viewController.viewModel.onLeftBarButtonItemTapped = { [weak self] in
    //            self?.closeModalNavigation()
    //        }
    //
    //        viewController.viewModel.onRightBarButtonItemTapped = { [weak self] delegate in
    //            self?.pushDeliveryAddressForm(delegate: delegate)
    //        }
    //
    //        viewController.viewModel.onSecondRoute = { [weak self] delegate in
    //            self?.pushSecondRouteAddressForm(delegate: delegate)
    //        }
    //
    //        viewController.viewModel.onSecondRouteTapped = { [weak self] address, delegate in
    //            self?.pushSecondRouteEditAddress(address: address, delegate: delegate)
    //        }
    //
    //        viewController.viewModel.onAddressTapped = { [weak self] address, delegate in
    //            self?.pushEditDeliveryAddressForm(address: address, delegate: delegate)
    //        }
    //
    //        presentModalNavigation(root: viewController, modalPresentationStyle: .formSheet)
    //    }
    //
    //    private func pushEditDeliveryAddressForm(address: AddressDomain, delegate: UserDeliveryAddressListViewModelDelegate) {
    //        let viewController = viewControllerFactory.makeEditDeliveryAddressFormViewController(address: address, delegate: delegate)
    //
    //        viewController.viewModel.onPopViewController = { [weak self] in
    //            self?.modalNavigationController?.popViewController(animated: true)
    //        }
    //
    //        viewController.viewModel.onPreferredCitiesPopoverPresent = { [weak self] data in
    //            let viewModel = BasePopoverViewModel(sections: data.sections)
    //            self?.presentPreferredCityListPopover(viewModel: viewModel,
    //                                                  sourceView: data.sourceView,
    //                                                  popoverPresentationControllerDelegate: data.popoverPresentationControllerDelegate)
    //
    //            return viewModel
    //        }
    //
    //        viewController.viewModel.onPopOverDismiss = { [weak self] completion in
    //            if let popoverViewController  = self?.modalNavigationController?.presentedViewController as? BasePopoverViewController {
    //                popoverViewController.dismiss(animated: true, completion: completion)
    //            }
    //        }
    //
    //        modalNavigationController?.pushViewController(viewController, animated: true)
    //    }
    //
    //    private func pushSecondRouteEditAddress(address: AddressDomain, delegate: UserDeliveryAddressListViewModelDelegate? = nil) {
    //        let viewController = viewControllerFactory.makeSecondRouteEditDeliveryAddressViewController(address: address, delegate: delegate)
    //
    //        viewController.viewModel.onPreferredCitiesPopoverPresent = { [weak self] data in
    //            let viewModel = BasePopoverViewModel(sections: data.sections)
    //            self?.presentPreferredPlaces(viewModel: viewModel,
    //                                         sourceView: data.sourceView,
    //                                         delegate: data.popoverPresentationControllerDelegate)
    //
    //            return viewModel
    //        }
    //
    //        viewController.viewModel.onPopOverDismiss = { [weak self] completion in
    //            if let popoverViewController  = self?.modalNavigationController?.presentedViewController as? BasePopoverViewController {
    //                popoverViewController.dismiss(animated: true, completion: completion)
    //            }
    //        }
    //
    //        viewController.viewModel.onPopViewController = { [weak self] in
    //            self?.modalNavigationController?.popViewController(animated: true)
    //        }
    //
    //        modalNavigationController?.pushViewController(viewController, animated: true)
    //    }
    //
    //    private func pushDeliveryAddressForm(delegate: OrdersDeliveryAddressListViewModelDelegate) {
    //        let viewController = viewControllerFactory.makeDeliveryAddressFormViewController(delegate: delegate)
    //
    //        viewController.viewModel.onPreferredCitiesPopoverPresent = { [weak self] data in
    //            let viewModel = BasePopoverViewModel(sections: data.sections)
    //            self?.presentPreferredCityListPopover(viewModel: viewModel,
    //                                                  sourceView: data.sourceView,
    //                                                  popoverPresentationControllerDelegate: data.popoverPresentationControllerDelegate)
    //
    //            return viewModel
    //        }
    //
    //        viewController.viewModel.onPopViewController = { [weak self] in
    //            self?.modalNavigationController?.popViewController(animated: true)
    //        }
    //
    //        viewController.viewModel.onPopOverDismiss = { [weak self] completion in
    //            if let popoverViewController  = self?.modalNavigationController?.presentedViewController as? BasePopoverViewController {
    //                popoverViewController.dismiss(animated: true, completion: completion)
    //            }
    //        }
    //
    //        modalNavigationController?.pushViewController(viewController, animated: true)
    //    }
    //
    //    private func pushSecondRouteAddressForm(delegate: OrdersDeliveryAddressListViewModelDelegate) {
    //        let viewController = viewControllerFactory.makeSecondRouteDeliveryAddressFormViewController(delegate: delegate)
    //
    //        viewController.viewModel.onPreferredCitiesPopoverPresent = { [weak self] data in
    //            let viewModel = BasePopoverViewModel(sections: data.sections)
    //            self?.presentPreferredPlaces(viewModel: viewModel,
    //                                         sourceView: data.sourceView,
    //                                         delegate: data.popoverPresentationControllerDelegate)
    //
    //            return viewModel
    //        }
    //
    //        viewController.viewModel.onPopOverDismiss = { [weak self] completion in
    //            if let popoverViewController  = self?.modalNavigationController?.presentedViewController as? BasePopoverViewController {
    //                popoverViewController.dismiss(animated: true, completion: completion)
    //            }
    //        }
    //
    //        viewController.viewModel.onPopViewController = { [weak self] in
    //            self?.modalNavigationController?.popViewController(animated: true)
    //        }
    //
    //        modalNavigationController?.pushViewController(viewController, animated: true)
    //    }
    //
    //    private func presentPreferredPlaces(viewModel: BasePopoverViewModel, sourceView: UIView?, delegate: UIPopoverPresentationControllerDelegate) {
    //        let viewController = viewControllerFactory.makePreferredCityListViewController(viewModel: viewModel,
    //                                                                                       sourceView: sourceView,
    //                                                                                       popoverPresentationControllerDelegate: delegate)
    //
    //        modalNavigationController?.present(viewController, animated: true)
    //    }
    //
    //    private func presentPreferredCityListPopover(viewModel: BasePopoverViewModel,
    //                                                 sourceView: UIView,
    //                                                 popoverPresentationControllerDelegate: UIPopoverPresentationControllerDelegate) {
    //        let viewController = viewControllerFactory
    //            .makePreferredCityListViewController(viewModel: viewModel,
    //                                                 sourceView: sourceView,
    //                                                 popoverPresentationControllerDelegate: popoverPresentationControllerDelegate)
    //
    //        modalNavigationController?.present(viewController, animated: true)
    //    }
    //
    //    private func pushExclusions(person: PersonDomain) {
    //        let viewController = viewControllerFactory.makeExclusionsViewController(person: person)
    //
    //        viewController.viewModel.onSendSuccess = { [weak self] in
    //            self?.navigationController?.popToRootViewController(animated: true)
    //        }
    //
    //        navigationController?.pushViewController(viewController, animated: true)
    //    }
    //
    //    private func pushUserProfile() {
    //        let viewController = viewControllerFactory.makeUserProfileViewController()
    //
    //        viewController.viewModel.onSaveSuccess = { [weak self] in
    //            self?.navigationController?.popViewController(animated: true)
    //        }
    //
    //        navigationController?.pushViewController(viewController, animated: true)
    //    }
    //
    //    private func pushContact() {
    //        let viewController = viewControllerFactory.makeContactViewController()
    //
    //        navigationController?.pushViewController(viewController, animated: true)
    //    }
    //
    //    private func pushChangePassword() {
    //        let viewController = viewControllerFactory.makeChangePasswordViewController()
    //
    //        viewController.viewModel.onChangePassowordSuccess = { [weak self] in
    //            self?.navigationController?.popViewController(animated: true)
    //        }
    //
    //        navigationController?.pushViewController(viewController, animated: true)
    //    }
    //
    //    private func startHomeOrdersCoordinator(orderId: Int? = nil,
    //                                              orderDietId: Int? = nil,
    //                                              myDietOrdersOption: MyDietOrdersOption,
    //                                              ordersListDelegate: OrdersListViewModeDelegate? = nil) {
    //
    //        guard let navigationController = self.navigationController else { return }
    //        let coordinator = MyDietOrdersCoordinator(orderId: orderId,
    //                                                  orderDietId: orderDietId,
    //                                                  myDietOrdersOption: myDietOrdersOption,
    //                                                  orderDetailsDelegate: ordersListDelegate,
    //                                                  navigationController: navigationController)
    //        childCoordinator = coordinator
    //        coordinator.start()
    //    }
    //
    //    private func presentOrdersDisabled() {
    //        let content = UserContext.shared.userPanel?.company.companyInfo?.infoOrdersDisabled
    //        let viewController = viewControllerFactory.makeOrdersDisabledViewController(content: content)
    //        viewController.viewModel = OrdersDisabledViewModel(content: content)
    //
    //        presentModalNavigation(root: viewController, modalPresentationStyle: .fullScreen)
    //    }
    //
    //    private func pushLoyaltyProgram() {
    //        let viewController = viewControllerFactory.makeLoyaltyProgramViewController()
    //
    //        bindLoyaltyViewController(viewController)
    //
    //        navigationController?.pushViewController(viewController, animated: true)
    //    }
    //
    //    private func pushRewardList(delegate: RewardDetailsViewModelDelegate) {
    //        let viewController = viewControllerFactory.makeRewardListViewController()
    //
    //        viewController.viewModel.onRewardPressed = { [weak self] reward in
    //            self?.pushRewardDetails(reward: reward, delegate: delegate)
    //        }
    //
    //        navigationController?.pushViewController(viewController, animated: true)
    //    }
    //
    //    private func pushRewardDetails(reward: RewardDomain,
    //                                   delegate: RewardDetailsViewModelDelegate) {
    //        let viewController = viewControllerFactory.makeRewardDetailsViewController(reward: reward,
    //                                                                                   delegate: delegate)
    //
    //        viewController.viewModel.onOrderReward = { [weak self] in
    //            if let viewController = self?.navigationController?.viewControllers.first(
    //                where: { ($0 as? LoyaltyProgramViewController) != nil }) {
    //                self?.navigationController?.popToViewController(viewController, animated: true)
    //            } else {
    //                guard let vc = self?.viewControllerFactory.makeLoyaltyProgramViewController() else { return }
    //                self?.navigationController?.viewControllers.insert(vc, at: 1)
    //                if let viewController = self?.navigationController?.viewControllers.first(
    //                    where: { ($0 as? LoyaltyProgramViewController) != nil }) as? LoyaltyProgramViewController {
    //                    self?.bindLoyaltyViewController(viewController)
    //                    self?.navigationController?.popToViewController(viewController, animated: true)
    //                }
    //            }
    //        }
    //
    //        viewController.viewModel.onPopToRootViewController = { [weak self] in
    //            self?.navigationController?.popToRootViewController(animated: true)
    //        }
    //
    //        navigationController?.pushViewController(viewController, animated: true)
    //    }
    //
    //    private func pushReferrals() {
    //        let viewController = viewControllerFactory.makeReferralsViewController()
    //
    //        navigationController?.pushViewController(viewController, animated: true)
    //    }
    //
    //    private func pushUserList() {
    //        let viewController = viewControllerFactory.makeUserListViewController()
    //
    //        (viewController.viewModel as? UserListViewModel)?.onPopViewController = { [weak self] in
    //            self?.navigationController?.popViewController(animated: true)
    //        }
    //
    //        (viewController.viewModel as? UserListViewModel)?.onUserPressed = { [weak self] person in
    //            self?.pushExclusions(person: person)
    //        }
    //
    //        navigationController?.pushViewController(viewController, animated: true)
    //    }
    //
    //    private func startBaseWebViewCoordinator(content: String,
    //                                             title: String,
    //                                             fileType: WebViewFileType = .html,
    //                                             worker: BaseWebViewWorker = BaseWebViewWorker()) {
    //        guard let navigationController = self.navigationController else { return }
    //        let baseWebViewCoordinator = BaseWebViewCoordinator(content: content,
    //                                                            navigationBarTitle: title,
    //                                                            navigationController: navigationController,
    //                                                            worker: worker,
    //                                                            closeMode: .pop,
    //                                                            fileType: fileType)
    //        childCoordinator = baseWebViewCoordinator
    //
    //        baseWebViewCoordinator.start(completion: nil)
    //    }
    //
    //    private func bindLoyaltyViewController(_ viewController: LoyaltyProgramViewController) {
    //        viewController.viewModel.onRegulationsPressed = { [weak self] content in
    //            self?.startBaseWebViewCoordinator(content: content, title: "loginRegulations".localized)
    //        }
    //
    //        viewController.viewModel.onRewardsPressed = { [weak self] delegate in
    //            self?.pushRewardList(delegate: delegate)
    //        }
    //
    //        viewController.viewModel.onReferralsPressed = { [weak self] in
    //            self?.pushReferrals()
    //        }
    //    }
    //}
}

//// MARK: - UINavigationControllerDelegate
//
extension HomeCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // It prevents from allowing user to open side menu using pan gesture on other view controllers than MyDietMenuViewController
//        if navigationController.viewControllers.count != 1 {
//            sideMenuData.panGesture?.isEnabled = false
//            sideMenuData.edgePanGesture?.isEnabled = false
//        } else {
//            sideMenuData.panGesture?.isEnabled = true
//            sideMenuData.edgePanGesture?.isEnabled = true
//        }
        Logger.error("HERE")
    }
}

