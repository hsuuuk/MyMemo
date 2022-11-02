/*
 
 ios 13이전 버전, 13이상 버전(Full Screen)은
 
 UITableViewController에서
 
 override func viewWillAppear(_ animated: Bool) {
     tableView.reloadData()
 }
 
 로 셀 업데이트 가능
 
 하지만, 13이상 버전(Sheet)는 Notification 사용해야함
 
 UITableViewController에서
 
 var token: NSObjectProtocol?
 
 deinit {
     if let token = token {
         NotificationCenter.default.removeObserver(token)
     }
 }
 
 override func viewDidLoad() {
     super.viewDidLoad()
     // addObserver 메서드는 옵져벌을 해제할 때 사용하는 객체를 나타내고, 이 객체를 토큰(Token)이라 부름.
     token = NotificationCenter.default.addObserver(forName: AddMemoViewController.newMemoDidInsert, object: nil, queue: OperationQueue.main) { [weak self] noti in
         self?.tableView.reloadData()
     }
 }
 
 AddMemoViewController에서
 
 static let newMemoDidInsert = Notification.Name("newMemoDidInsert")
 
 @IBAction func save(_ sender: Any) {
     NotificationCenter.default.post(name: AddMemoViewController.newMemoDidInsert, object: nil)
 }

 
 
*/


/*
 
 prepare
 세그웨이가 연걸된 화면을 생성하고, 화면을 전화하기 직전에 호출되는 메서드
 
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
         if let vc = segue.destination as? DetailViewController {
             vc.memo = Memo.dummyMemoList[indexPath.row]
         }
     }
 }
 
*/
