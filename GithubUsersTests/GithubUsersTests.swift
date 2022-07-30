//
//  GithubUsersTests.swift
//  GithubUsersTests
//
//  Created by Kumail kashefi on 12/07/2022.
//

import XCTest
import RxSwift
import RxCocoa
import Moya

class GithubUsersTests: XCTestCase {
    var disposeBag = DisposeBag()
    var data: Observable<[Items]>?
    let interactor = UserListInteractor.init(userListNetworkService: UserListNetworkService())
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testUserInteractor() {
        XCTAssertNotNil(interactor.getUsers(type: "muhammadkumail"))
        
    }
    
    func testUserViewModel() {
        data = interactor.getUsers(type: "muhammadkumail")
        let userVm = UsersViewModel(items: data)
        XCTAssertNotNil(userVm.getUsers())
    }
    
    func testUserView() {
        
        data = interactor.getUsers(type: "muhammadkumail")
        data?.subscribe(onNext: { items in
            UIImageView().setImage(urlString: items.first?.avatar_url, imageView: UIImageView())
            XCTAssertNotNil(items.first?.avatar_url)
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
    }
    
    func testAlertDisplay()  {
        
        AlertService.sharedInstance.displayAlert(message: Alert.loginTypeEmpty.rawValue)
    }
    
    func testThrowAlert()  {
        interactor.throwAlert()
    }
    
    func testGetUserWithCorrectUrlShouldNotBeNil() {
        let errorExpectation = expectation(description: "error")
        data = interactor.getUsers(type: "muhammadkumail")
        errorExpectation.fulfill()
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNotNil(self.data)
        }
    }
    
    func testGetUserAvatarUrlShouldNotBeNil() {
        let errorExpectation = expectation(description: "error")
        data = interactor.getUsers(type: "muhammadkumail")
        var imageData: Data?
        data?.subscribe(onNext: { items in
            UIImageView().getData(from: URL(string: items.first?.avatar_url ?? "")!) { data, response, error in
                imageData = data
                errorExpectation.fulfill()
            }
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        
        waitForExpectations(timeout: 20) { (error) in
            XCTAssertNotNil(imageData)
        }
    }
    
    func testAppColor()  {
        XCTAssertNotNil(AppColors.navigationColor)
    }

}
