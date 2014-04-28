//
//  ViewController.h
//  OneMilliontimesPhone
//
//  Created by 篠原正樹 on 2014/04/04.
//  Copyright (c) 2014年 masaki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoundViewController.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>


NSString *listPath;//plistパス取得に利用
NSMutableDictionary * dictionary;//plistのkey value格納に利用
NSNumber *countNum;//dictionaryから値取得
int countNumber;//dictionaryから取得した値をキャストして利用
NSNumber *number;//plistに格納するための型変換に利用
int selectedSound;
NSNumber *sound;

@interface ViewController : UIViewController
{
    IBOutlet UILabel *counter;
    IBOutlet UIImageView *phone;
    IBOutlet UIImageView *brokenPhone;
    IBOutlet UIImageView *brokendPhone;
    IBOutlet UIButton *screenBtn;
    IBOutlet UIImageView *restart;
    IBOutlet UIButton *restartBtn;

}

@property(nonatomic, retain)IBOutlet UIButton *screenBtn;

- (IBAction)Push:(id)sender;
- (IBAction)Restart:(id)sender;
-(IBAction)MoveToSound:(id)sender;
-(IBAction)TweetButton:(id)sender;

@end

