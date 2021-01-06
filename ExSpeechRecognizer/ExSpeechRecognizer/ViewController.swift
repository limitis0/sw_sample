//
//  ViewController.swift
//  ExSpeechRecognizer
//
//  Created by Ting-Wei Lee on 2021/1/4.
//

import UIKit
import Speech

class ViewController: UIViewController, SFSpeechRecognizerDelegate, SFSpeechRecognitionTaskDelegate {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var micBtn: UIButton!
    
    //define the language which user is going to use
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "zh_TW"))
    
    //Deal With Speech Recognition
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest? // -> deal with the request of speech recognition
    private var recognitionTask: SFSpeechRecognitionTask? // -> tells the results of recognition
    private let audioSession = AVAudioSession.sharedInstance()// 裝置音訊
    private let audioEngine = AVAudioEngine() //-> offers the input of speech
    
    private var inputNode: AVAudioInputNode?
    
    // 麥克風按鈕是否可點,取決於使用者許可權
    private var micButtonEnabled = false
    
    // 語音識別結果
    private var recordResult:String = ""
    
    private var timer:Timer!// 說話間隔時間
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        speechRecognizer?.delegate = self
        
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
            
            switch authStatus {
            case .authorized:
                self.micButtonEnabled = true
                print("auth: success")
            case .notDetermined:
                self.micButtonEnabled = false
                print("auth: not determined")
            case .denied:
                self.micButtonEnabled = false
                print("auth: denied")
            case .restricted:
                self.micButtonEnabled = false
                print("auth: restricted")
            @unknown default:
                self.micButtonEnabled = false
                print("auth: unknown failure")
            }
            
//            OperationQueue.main.addOperation {
//                self.micBtn.isEnabled = isBtnEnabled
//            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        // 獲取當前語音識別許可權
        AVAudioSession.sharedInstance().requestRecordPermission { (permiss:Bool) in
            print("micBtnEnabled: \(permiss)")
            self.micButtonEnabled = permiss
        }
    }
    
    @IBAction func triggerMic(_ sender: Any) {
        print("triggerMic")
        startRecording()
        micBtn.setTitle("StartRecording", for: .normal)
//        if audioEngine.isRunning {
//            startRecording()
//            micBtn.setTitle("StartRecording", for: .normal)
//        } else {
//            stopRecording()
//            micBtn.setTitle("StopRecording", for: .normal)
//        }
    }
    
    // 開始語音識別(這是我們自己寫的方法,在麥克風按鈕事件中呼叫這個函式)
    func startRecording(){
        print("startRecording")
    // 判斷音聲引擎是否在執行
        if !audioEngine.isRunning {
            recordResult = "" // 接收識別結果的String賦為空
            recording()
        }
    }
    // 語音識別終止
    func stopRecording(){
        print("stopRecording")
        if (recognitionRequest != nil) {
            recognitionRequest?.endAudio()
        }
    }
    // 語音識別詳細內容
    func recording() {
        print("recording")
        // 判斷目前有無識別任務,取消之前所有任務
        if recognitionTask != nil {
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        do {
            // 設定裝置音訊
            try audioSession.setCategory(AVAudioSession.Category.record) // 將音訊設定為錄音
            try audioSession.setMode(AVAudioSession.Mode.measurement)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("audioSession properties weren't set because of an error.")
        }
        // 初始化識別請求
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        inputNode = audioEngine.inputNode
        print("inputNode: \(String(describing: inputNode))")
        guard inputNode == audioEngine.inputNode else {
            fatalError("Audio engine has no input node")
        }

        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
        }
        recognitionRequest.shouldReportPartialResults = true
        // 登機語音識別任務
        recognitionTask = speechRecognizer!.recognitionTask(with: recognitionRequest, delegate: self)

        // 麥克風獲取語音片斷
        let recordingFormat = inputNode?.outputFormat(forBus: 0)

        // 追加後續輸入的語音
        inputNode?.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.recognitionRequest?.append(buffer)
        }
        audioEngine.prepare()
        do {
            // 開始錄音
            print("開始錄音")
            try audioEngine.start()
        } catch {
            print("audioEngine couldn't start because of an error.")
        }
    }
    
    /// 判斷當前是否連線網路
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
    // 這裡有兩點不足: 1:只有關閉或開啟網路的操作時這個函式才執行,如果我一直不改變網路狀態, 這個函式等於沒用。假設我點選語音按鈕時判斷available是否為true, false時彈出alert提示沒網, 那麼裝置沒聯網的狀態下開啟app且不改變網路狀態, 點選語音按鈕就不會提示, 這就需要程式設計師自己判斷了。2:這個函式判斷不了當前連線的網路是否有效,比如連了一個無效的wifi,available還是為true
        print("speechRecognizer")
    }
    // 錄音過程中獲取到聲音
    func speechRecognitionTask(_ task: SFSpeechRecognitionTask, didHypothesizeTranscription transcription: SFTranscription) {
    // 這個代理方法非常重要,錄音過程中檢測到聲音就會執行,比如說了話之後讓他自動結束語音,就可以在此加上計時器timer。
        print("speechRecognitionTask")
        if(timer != nil && timer.isValid){
            timer.invalidate()
            timer = nil
        }
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { (Timer) in
            self.stopRecording()
        })
        //只要在說話,計時器就不會走,停止說話計時器開始走,停止2兩秒不說話,則錄音就會自動結束開始識別成文字,時間可以自己設定
    }
    // 開始識別語音
    func speechRecognitionTaskFinishedReadingAudio(_ task: SFSpeechRecognitionTask) {
        print("speechRecognitionTaskFinishedReadingAudio")
        // 將聲音轉成文字,這個函式裡面可以什麼都不用寫
    }
    // 錄音結束之後的識別處理
    func speechRecognitionTask(_ task: SFSpeechRecognitionTask, didFinishRecognition recognitionResult: SFSpeechRecognitionResult) {
        print("speechRecognitionTask: \(recognitionResult)") // 輸出的是一個數組,裡面是所有識別出來的結果
        // 獲取最優的結果,這裡看情況,不一定是你需要的那個,也可以做一個tableView,讓使用者自己選結果
        recordResult = recognitionResult.bestTranscription.formattedString
    }
    // 語音轉文字結束
    func speechRecognitionTask(_ task: SFSpeechRecognitionTask, didFinishSuccessfully successfully: Bool) {
        // 語音識別結束後,在這裡釋放物件
        print("speechRecognitionTask: 語音識別結束後,在這裡釋放物件")
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        self.recognitionRequest = nil
        self.recognitionTask = nil
        do {
            // 新增這個程式碼是因為涉及到文字轉語音的需求。語音識別會讓音訊處於錄音狀態,這個時候要朗讀文字的話根本沒有聲音,所以需要新增這個設定。
            try audioSession.setCategory(AVAudioSession.Category.ambient)
        } catch let error as NSError {
            print(error.code)
        }
        if(timer != nil){
            timer.invalidate()
            timer = nil
        }
        // 在這裡,大家拿到了recordResult,就可以做想做的事啦
        textView.text = recordResult
    }
}

