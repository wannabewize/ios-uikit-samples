# iOS-Samples
iOS 10 Samples.

## 01_Tools

## 02_BuildingScene

- ThreeViewsByCode :  코드로 뷰 작성하기
- CodeAndView : 태그(tag), 아웃렛 등을 이용해서 코드로 뷰 다루기

## 03_ViewAndContents

- Labels : 레이블(UILabel) 예제
- ImageFiles : 이미지 파일과 이미지 뷰
- ImageAssets : 애셋을 이용한 이미지 리소스 다루기
- ContentMode : 뷰 컨텐트 모드
- ViewStretch : 뷰 스트레칭. 슬라이싱

## 04_Layout

- FrameLayout : 프레임 기반의 레이아웃. 기기 회전에 대응하지 못한다.
- AutoLayout : 제약조건을 이용한 오토레이아웃
- StackView : IB를 이용한 스택뷰
- AdaptiveUI : 적응형 UI 
- AutoLayoutByCode : 코드를 이용한 오토레이아웃
- StackViewByCode : 코드를 이용한 스택뷰

## 05_InteractiveScene

- Buttons : 버튼 
- ButtonAndAction : 버튼과 이벤트 다루기.
- ButtonAndActionByCode : 코드로 버튼과 이벤트 다루기
- SegmentedControl : 코드로 세그먼디트 컨트롤 다루기
- Toolbar : 코드로 툴바 다루기
- NumberChange : 슬라이더와 스테퍼 예제
- ActivityIndicate : 스위치와 액티비티 인디게이터 예제
- ColorSlider : 슬라이더를 이용한 색깔 변화

## 06_SceneWithText

- TextField : 텍스트필드
- TextEditing : 편집 이벤트 다루기
- TextFieldAndKeyboard : 키보드 이벤트 알림과 텍스트필드

## 07_Dialog

- Dialog : 얼럿 컨트롤러를 이용한 다이얼로그

## 08_Picker

- DatePicker : 날짜 피커
- Timer : 날짜 피커를 이용한 타이머
- PickerView : 피커
- PickerAndArray : 피커와 배열
- ImagePicker : 이미지 뷰 기반의 피커

## 09_ScrollView

- ScrollViewAndContent : 스크롤뷰와 콘텐츠 출력
- ScrollViewAndKeyboard : 스크롤뷰에서 키보드 다루기
- EmbeddingScene : 씬 내장 방식으로 UI작성하기
- ScrollViewPaging : 페이지 기능을 이용한 UI작성

## 10_ListScene

- BasicTable : 테이블뷰 기본
- DynamicCellHeight : 셀 높이 동적 자동 설정
- CellSelect : 테이블뷰 셀 선택
- TableEditing : 테이블뷰를 이용한 편집
- CustomCell : 커스텀 셀
- StaticCell : 정적 테이블뷰를 이용한 정적 테이블
- PullToRefresh : 당겨서 다시 읽는 테이블뷰

## 11_GridScene

- CollectionView : 콜렉션 뷰
- CollectionViewCustomLayout : 커스텀 레이아웃을 적용한 콜렉션 뷰
- TableAndCollectionView : 테이블 뷰 셀에 콜렉션 뷰 내장하기(작성 중)

## 12_DynamicScene

- ViewAnimation : 뷰 속성 변화를 이용한 애니메이션
- Transition : 트랜지션
- Touch : 터치를 이용한 이미지 끌기 예제
- Gesture : 제스처 인식기를 이용한 이미지 끌기, 회전, 확대/축소 예제
- PanAndSwipeGesture : Pan, Swift 제스처 인식기와 제스처 상태값
- TouchAndGesture : 제스처 인식기와 터치 API 사용 설정
- DynamicsAttachment : 다이나믹스 - 연결 행위 예제
- FallingBlock : 다이나믹스 - 중력과 충돌 효과 예제

## 13_Drawing

- Drawing : 커스텀 뷰 생성과 그리기
- BezierPath : 베이저패스를 이용한 그리기
- TouchDrawing : 터치와 그리기

## 14_AppArchitecture

- SceneChange : 스토리보드 다루기. Window의 RootViewController를 이용한 씬 전환.
- TodoWithMVC : MVC를 적용한 할일 관리. TodoManager 모델

## 15_MultiScene

- Modal : 모방 방식으로 씬 전환. 데이터 교환
- NaviBasedApp : 내비게이션 컨트롤러를 이용한 씬 전환 예제
- MasterDetail : 마스터-디테일 예제. 목록 형태의 마스터에서 선택한 상세 정보를 출력하는 디테일 씬 예제
- TableViewAndNaviBar : 내비게이션 컨트롤러 기반에서 테이블 뷰의 스크롤 Inset, 뷰 컨트롤러의 편집 속성과 버튼 활용
- TabBasedApp : 탭 기반의 씬 구조 예제
- SplitScene : 스플릿 뷰 컨트롤러를 이용한 멀티 씬 예제

## 16_Persistence

- BundleData : 샌드박스 경로와 번들 내 데이터를 초기 데이터로 사용하는 예제
- DataSave : 기본 데이터 타입 저장
- UserDefault : 유저 디폴트를 이용한 설정 저장과 로딩
- SQLite : SQLite 예제
- TodoWithSQLiteSwift : SQLiteSwift 라이브러리를 이용한 할일 관리 예제
- CoreDataExample : CoreData를 이용한 CRUD 예제
- TodoWithCoreData : Coredata를 이용한 할일 관리 예제
- RealmExample : Realm(realm.io)을 이용한 CRUD 예제
- TodoWithRealm : Realm을 이용한 할일 관리 예제

## 17_Networking

- WebkitExample : WebKit, SafariViewController 예제
- WebView : UIWebView 예제
- SyncAndAsync : 동기/비동기 방식의 네트워크. 동기식인 경우 UI가 블록된다. 비동기는 메인 쓰레드에서 UI 업데이트
- SessionAndTask : URLSession과 태스크 예제
- NetworkLibraries : Alamofire, AlamofireImage 예제
- TopSongsXML : XML 파싱 예제
- TopSongsJSON : JSON 파싱 예제

## 18_CameraAndPhotos

- ImagePicker : 이미지 피커를 이용해서 사진 촬영과 앨범 내 사진 선택
- MyPhotos : 포토 프레임웥크를

## 19_Multimedia

- MyMediaPlayer : MediaFramework를 이용한 음악 선택/쿼리 재생
- MyAVFoundationPlayer : AVFoundation을 이용한 음악 재생, 재생 위치 이동
- AVRecorder : AVAudioRecoder를 이용한 녹음
- MoviePlay : 동영상 재생

## 20_LocationBased

- MapView : 맵뷰와 카메라, 맵뷰 델리게이트로 지도 이동 이벤트
- SimpleAnnotation : 어노테이션 추가/삭제
- VariousSpot : 커스텀 어노테이션/커스텀 어노테이션 뷰 예제
- SpotAction : 어노테이션 뷰의 컨트롤
- MapOverlay : 맵뷰에 오버레이를 이용한 도형 그리기
- UserLocation : 사용자 위치 정보 얻기
- LocationConvert : 뷰 위치(x,y), 위경도, 주소 변환 예제


## 20_Sensor

## 21_AddressAndScedule