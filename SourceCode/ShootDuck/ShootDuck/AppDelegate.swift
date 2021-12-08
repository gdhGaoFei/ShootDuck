//
//  AppDelegate.swift
//  ShootDuck
//
//  Created by 华&梅 on 2021/12/8.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    /// 主窗口
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /// 初始化window
        self.initWindow()
        
        return true
    }
    

    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}


//MARK: - ===== 设置主窗口 及 主视图控制器
extension AppDelegate: UIWindowSceneDelegate {
    
    /// 初始化window
    fileprivate func initWindow() -> () {
        /// iOS13以上的 使用 SceneDelegate
        if #available(iOS 13.0, *) {
        }else{
            /// 其他的系统使用原来的
            let wd = UIWindow()
            self.window = wd
            /// 设置主窗口
            self.setMainWindow()
        }
    }
    
    /// 设置主窗口
    func setMainWindow() -> () {
        if let wd = self.window {
            wd.frame = UIScreen.main.bounds
            wd.backgroundColor = UIColor.white
            wd.makeKeyAndVisible()
            /// 设置主视图控制器
            self.setMainViewController()
        }
    }
    
    /// 设置主的视图控制器
    func setMainViewController() -> () {
        /// 可以在 ViewController做一些操作 - 在操作完成之后 进入主程序
        let vc_root = UIStoryboard.init(name: "LaunchScreen", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
        self.window?.rootViewController = vc_root
        
        /// 模拟一些操作 跳转到 登录界面 或者 主界面
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            self.window?.rootViewController = TestRootViewController()
        }
    }
}
