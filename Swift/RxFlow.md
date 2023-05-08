# RxFlow

기존의 앱 내 다른 뷰로 이동하기 위해서는 직접 코드를 구현하거나, 내장된 segue나 스토리보드를 이용해 뷰를 전환했다.
하지만 이 방법은 뷰컨을 더 복잡하게 만듬. 그렇다고해서 디자인패턴(라우터, 코디네이터)을 사용하면 해결되는 문제는 아님. 항상 코디네이터 패턴을 반복해서 작성해야하고, 뷰모델이 코디네이터와 연결될 수 있도록 하는데 있어서 많은 대리자 위임이 발생.

### 따라서 RxFlow는

뷰컨에서의 탐색 매커니즘을 제거하고 Reactive하게, 종속성 주입이 쉽게하는 것을 목표로 만들어진 라이브러리

#### RxFlow를 이해하기 위한 6가지 용어
- Flow<br>
앱 내의 탐색 영역을 정의한다. 또한 탐색작업을 선언하는 위치
- Step<br>
각 Step은 앱의 모든 탐색 작업이며 Flow와 Step의 조합은 가능한 모든 탐색작업을 설명한다.
- Stepper<br>
Step을 생성할 수 있는 모든것으로써, Flow 내에서 모든 탐색 작업을 트리거할 책임이 있다.
- Presentable<br>
표현할 수 있는 것의 추상화 (뷰컨과 Flow도 Presentable), 코디네이터가 UIKit 호환 방식으로 흐름 단계를 처리하기 위해 구독할 Reactive observable을 제공함.
- Flowable<br>
Presentable와 Stepper를 결합한 데이터 구조이며, 코디네이터에게 다음에 생성해야 할 작업이 무엇인지 알려준다.
- Coordinator<br>
개발자가 탐색 가능성을 나타내는 흐름과 단계의 적절한 조합을 정의하면 이 조합을 일관된 방식으로 혼합




## 구조

<img width="1000" height="500" alt="image" src="https://user-images.githubusercontent.com/66459715/236720635-6c1413e9-1631-4ab6-a925-beffaa038005.png">


## 실제로 만들어보기!

### Step
Step은 궁극적으로 탐색 의도를 표현하는 상태의 작은 조각이며 열거형으로 선언합니다.
```swift
enum ExampleStep: Step {
    case launchIsRequired
    
    case mainIsRequired
    
    case homeIsRequired
    case mypageIsRequired
    
    case homeNext
    case mypageNext
}
```
### Flow
LaunchScreen과 MainFlow로 탈 수 있게 navigate(to:) 함수를 구현하여 Step을 탐색 작업으로 변환합니다 .
```swift
final class AppFlow: Flow {
    
    private let window: UIWindow
    
    var root: Presentable {
        return self.window
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? ExampleStep else { return .none }
        
        switch step {
        case .launchIsRequired:
            return navigateToLaunchScreen()
        case .mainIsRequired:
            return navigateToMainTabBar()
        default:
            return .none
        }
    }
    
    private func navigateToLaunchScreen() -> FlowContributors {
        let viewController = LaunchViewController()
        window.rootViewController = viewController
        return .one(flowContributor: .contribute(withNext: viewController))
    }
    
    private func navigateToMainTabBar() -> FlowContributors {
        let flow = MainFlow()
        let stepper = MainStepper()
        
        Flows.use(flow, when: .created, block: {[unowned self] root in
            self.window.rootViewController = root
        })
        return .one(flowContributor: .contribute(withNextPresentable: flow, withNextStepper: stepper))
    }
}
```
### Stepper
시작점이 될 AppStepper의 initialStep을 Stepe단계에서 작성한 열거형의 launch로 흐르게끔 설정합니다.
```swift
struct AppStepper: Stepper {
    let steps = PublishRelay<Step>()
    
    var initialStep: Step {
        return ExampleStep.launchIsRequired
    }
}
```

이후 시작점을 SceneDelegate에서 설정
```swift
//SceneDelegate

var coordinator = FlowCoordinator()
let appFlow = AppFlow(window: window)
coordinator.coordinate(flow: appFlow,with: AppStepper())
```

LaunchScreen이 맨 처음 시작된다는 것을 알았으니, 이후 mainIsRequired를 accept하게 되고 MainFlow(TabBar)를 타게됩니다.
```swift
class LaunchViewController: UIViewController, Stepper {
    var steps = PublishRelay<Step>()
    
    private let label: UILabel = {
        let v = UILabel()
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {[unowned self] in
            self.steps.accept(ExampleStep.mainIsRequired)
        })
    }
}
```
HomeFlow를 타서 다음 뷰를 띄우고 싶다면 동일한 방법으로 Flow를 작성합니다.
```swift
final class HomeFlow: Flow {
    var root: Presentable {
        return self.navigationController
    }
    
    private let navigationController = UINavigationController()
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? ExampleStep else { return .none }
        switch step {
        case .homeIsRequired:
            return navigateToHome()
        case .homeNext:
            return navigateToNext()
        default:
            return .none
        }
    }
    
    private func navigateToHome() -> FlowContributors {
      let viewController = HomeViewController()
      viewController.title = "Home"
      navigationController.pushViewController(
        viewController, animated: false
      )
      return .one(flowContributor: .contribute(withNext: viewController))
    }
    
    private func navigateToNext() -> FlowContributors {
      let viewController = HomeNextViewController()
      viewController.title = "Home_Next"
      navigationController.pushViewController(
        viewController, animated: true
      )
      return .none
    }
}
```

## 결과
<img width="400" height="800" alt="image" src="https://user-images.githubusercontent.com/66459715/236729805-08404a25-d514-4903-8cbb-176f4d10541d.gif">
