//
//  SoundViewController.h
//  OneMilliontimesPhone
//
//  Created by 篠原正樹 on 2014/04/11.
//  Copyright (c) 2014年 masaki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>
#import "ViewController.h"

NSNumber *sd;//plistに格納するための型変換に利用

@interface SoundViewController : UIViewController{
    IBOutlet UIButton *sound1Button;    // サウンド１ボタン
    IBOutlet UIButton *sound2Button;    // サウンド2ボタン
    IBOutlet UIButton *sound3Button;    // サウンド3ボタン
    IBOutlet UIButton *muteButton;    // muteボタン
    IBOutlet UIButton *okButton;    // okボタン
}

@property (nonatomic, retain) UIButton *sound1Button;
@property (nonatomic, retain) UIButton *sound2Button;
@property (nonatomic, retain) UIButton *sound3Button;
@property (nonatomic, retain) UIButton *muteButton;
@property (nonatomic, retain) UIButton *okButton;


// sound1ボタンを押したときに呼ばれるメソッド
-(IBAction)executeSound1:(id)sender;
// sound2ボタンを押したときに呼ばれるメソッド
-(IBAction)executeSound2:(id)sender;
// sound3ボタンを押したときに呼ばれるメソッド
-(IBAction)executeSound3:(id)sender;
// muteボタンを押したときに呼ばれるメソッド
-(IBAction)executeMute:(id)sender;
// okボタンを押したときに呼ばれるメソッド
-(IBAction)executeOk:(id)sender;

@end
