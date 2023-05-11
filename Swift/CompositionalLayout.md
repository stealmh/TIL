# Swift CompositionalLayout

## CompositionalLayout?

- CollectionView는 iOS 6에 도입이 되었습니다. FlowLayout과 함께 레이아웃을 제공해주었습니다. 그 당시에는 화면구성이 단순했을 수 있습니다.
- 오늘날의 앱은 장치가 다양해지고 화면크기가 달라짐에 따라 화면구성이 매우 복잡해졌습니다. 당장에 App Store만 봐도 알 수 있습니다. 따라서 이를 해결하기 위해 CompositionalLayout이  탄생하였습니다.

## 장점

- 레이아웃을 구축하는 세개의 키워드가 있습니다. 단순한 것에서 복잡한 것을 만드는 아이디어입니다.
- 유연하게 설계되었습니다.
- 하위 클래스를 만들지 않습니다.

… WWDC 19 일부 번역

## 구성

- Item
- Group
- Section

<img width="350" alt="image" src="https://github.com/APPSCHOOL1-REPO/finalproject-msg/assets/66459715/930e2c8d-5f90-4f3b-a2e9-83dde981a76c">

하나의 Item이 모이고 이를 감싼 Group이 있으며 이를 또 감싼 Section이 존재합니다.

### 실제로 만들어보기

1. collectionView 생성
    
    ```swift
    private let collectionView = UICollectionView(
    	frame: .zero,
    	collectionViewLayout: ViewController.createLayout()
    )
    ```
    
2. createLayout() 구현
    
    ```swift
    static func createLayout() -> UICollectionViewCompositionalLayout {
            return UICollectionViewCompositionalLayout {
    						 (sectionNumber, env) -> NSCollectionLayoutSection? in   
    }
    ```
    
    CompositionalLayout을 쓰는 이유는 복잡하고 여러개의 Section을 가진다는 상황으로 sectionNumber를 받을 준비를 합니다. <br> Item / Group / Section 모두 클로저 내부에 작성합니다.
    
3. Item 구현
    
    ```swift
    let item = NSCollectionLayoutItem(
    		layoutSize: NSCollectionLayoutSize(
    				widthDimension: .fractionalWidth(1),
    				heightDimension: .fractionalHeight(1)))
    
    // item.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)
    ```
    
    - 이름에서도 직관적으로 알 수 있듯이 항목의 layoutSize를 정해주어야 합니다.
    - width/height Dimension의 사이즈를 정하는 방법은 총 3가지가 있습니다.
        - .fractional → 비율
        - .absolute - 고정된 크기
        - .estimated - 런타임에 변경
4. Group 구현
    
    ```swift
    let group = NSCollectionLayoutGroup.vertical(
    		layoutSize: NSCollectionLayoutSize(
    				widthDimension: .fractionalWidth(1/5),
    				heightDimension: .fractionalHeight(1/5)),
    		subitem: item,
    		count: 1)
    ```
    
    - 그룹의 layoutSize를 정해주어야 합니다.
    - 그룹을 어떻게 보여줄 지 vertical과 horizontal이 있습니다.
    - subitem은 반복할 하위 항목입니다. count만큼의 subitem을 만들어냅니다.

5. Section 구현

```swift
let section = NSCollectionLayoutSection(group: group)
section.orthogonalScrollingBehavior = .groupPaging

...
return section
```

- 섹션의 그룹을 세팅해줍니다.
- orthogonalScrollingBehavior를 통해 세팅한 그룹을 페이징해서 넘길 수 있게 만들어줍니다.
- orthogonalScrollingBehavior
    
    ```swift
    public enum UICollectionLayoutSectionOrthogonalScrollingBehavior {
    
    	//기본 동작으로써 기본 레이아웃 축을따라 레이아웃
    	case none = 0
    
    	//기본 레이아웃 축에 직각으로 배치되며, horizontal 축에서 스크롤됨
    	case continuous = 1
    
    	//스크롤 하다보면 뷰의 leading에 딱 멈춤 단, 끝이 보이면 넘어가지 않음
    	case continuousGroupLeadingBoundary = 2
    
    	//페이지단위로 넘어감
      //Item이 10개이고 화면에 보이는 Item이 5개면은 5개단위로 2개의 페이지로 나눠짐 
    	case paging = 3
    
    	//섹션 레이아웃 그룹의 차원에 의해 결정되는 부분 크기 페이징 동작 (??)
    	case groupPaging = 4
      //각 그룹의 콘텐츠를 중앙에 배치하기 위해 추가 선행 및 후행 콘텐츠 삽입이 있는 그룹 페이징
    	case groupPagingCentered = 5
    }
    ```
    

### 결과
<img src="https://github.com/APPSCHOOL1-REPO/finalproject-msg/assets/66459715/46f2ac4e-54a6-4af3-8c69-87793a585271"></img>
