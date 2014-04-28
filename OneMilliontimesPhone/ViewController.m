//
//  ViewController.m
//  OneMilliontimesPhone
//
//  Created by 篠原正樹 on 2014/04/04.
//  Copyright (c) 2014年 masaki. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property NSDictionary * accountStore;

@end

@implementation ViewController

@synthesize screenBtn;


/////////////////plistディレクトリ取得start////////////////////////////////

-(NSString *)docsDir {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
}

/////////////////plistディレクトリ取得start////////////////////////////////


///////////////////////起動再起動時処理start////////////////////////////////////

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    //plist取得処理start//
    //plistのpath取得
    listPath = [[self docsDir] stringByAppendingPathComponent:@"count.plist"];
    
    //cheak plist
    if (![[NSFileManager defaultManager]fileExistsAtPath:listPath]) {
        [[NSFileManager defaultManager]copyItemAtPath:[[NSBundle mainBundle]pathForResource:@"count" ofType:@"plist"] toPath:listPath error:nil];
    }
    //plist Data取得
    dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:listPath];
    counter.text = [NSString stringWithFormat:@"%@", [dictionary objectForKey:@"pastCount"]];
    
    //dictionary情報をintにキャスト
    countNum = [dictionary objectForKey:@"pastCount"];
    countNumber = [countNum intValue];
    
    //plist取得処理end//
    
    //取得情報利用処理start//
	
    if ( countNumber >= 500001) {
        brokenPhone.hidden = YES;
        brokendPhone.hidden = YES;
        counter.hidden = NO;
        [screenBtn setEnabled:YES];
        restart.hidden = YES;
        [restartBtn setEnabled:NO];
        
    }
    
    else if (countNumber >= 1) {
        brokenPhone.hidden = NO;
        brokendPhone.hidden = YES;
        brokenPhone.image = [UIImage imageNamed:@"phone2.png"];
        counter.hidden = NO;
        [screenBtn setEnabled:YES];
        restart.hidden = YES;
        [restartBtn setEnabled:NO];
        
    }
    
    else if (countNumber  == 0) {
        brokenPhone.hidden = YES;
        brokendPhone.hidden = NO;
        brokendPhone.image = [UIImage imageNamed:@"phone3.png"];
        counter.hidden = YES;
        [screenBtn setEnabled:NO];
        [restartBtn setEnabled:YES];
        restart.hidden = NO;
    }
    
    //取得情報利用処理end//
    
    //sound情報取得処理
    NSString *selectedS = [dictionary objectForKey:@"selectS"];
    selectedSound = [selectedS intValue];
    
    //アニメーション情報取得処理
    NSArray *imageArray;
    imageArray = [[ NSArray alloc] initWithObjects:
                  [UIImage imageNamed:@"phone1.png"],
                  [UIImage imageNamed:@"phone2.png"],
                  [UIImage imageNamed:@"phone1.png"], nil];
    
    phone.animationImages = imageArray;
    phone.animationDuration = 0.1;
    phone.animationRepeatCount = 1;
    
}
///////////////////////起動再起動時処理end////////////////////////////////////


- (void)didReceiveMemoryWarning{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


///////////////////////pushボタンstart////////////////////////////////////
- (IBAction)Push:(id)sender {
    
    //plist情報をdictionaryに格納
    dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:listPath];
    
    //dictionary情報をintにキャスト
    NSNumber *countNum = [dictionary objectForKey:@"pastCount"];
    countNumber = [countNum intValue];
    countNumber = countNumber - 1;
    counter.text = [NSString stringWithFormat:@"%i", countNumber];
    
    //カウントが500000と0で画面表示変更
    if (countNumber == 500000) {
        brokenPhone.hidden = NO;
        brokenPhone.image = [UIImage imageNamed:@"phone2.png"];
        brokendPhone.hidden = YES;
        counter.text = [NSString stringWithFormat:@"%i", countNumber];
    }
    
    else if (countNumber == 0) {
        brokenPhone.hidden = YES;
        brokendPhone.hidden = NO;
        brokendPhone.image = [UIImage imageNamed:@"phone3.png"];
        counter.hidden = YES;
        [screenBtn setEnabled:NO];
        restart.hidden = NO;
        [restartBtn setEnabled:YES];
        
    }
    
    //numberをcount.plistに格納
    number = [[NSNumber alloc] initWithInt:countNumber];//from int to nsnumber
    [dictionary setValue:number forKey:@"pastCount"];
    [dictionary writeToFile:listPath atomically:YES];
    
    //サウンド処理
    sound = [dictionary objectForKey:@"selectedS"];
    selectedSound = [sound intValue];
    if (selectedSound == 1) {
        AudioServicesPlaySystemSound (1002);  //効果音再生
    }
    
    else if(selectedSound == 2){
        AudioServicesPlaySystemSound (1003);  //効果音再生
    }
    
    else if(selectedSound == 3){
        AudioServicesPlaySystemSound (1004);  //効果音再生
    }
    
    else if (selectedSound == 4){
        AudioServicesPlaySystemSound (1011);  //mute
    }
    
    //アニメーション処理
    [phone startAnimating];
    
    
}

///////////////////////pushボタンend////////////////////////////////////////////////


///////////////////////restartボタン////////////////////////////////////////////////
- (IBAction)Restart:(id)sender {
    
    //from int to nsnumber
    number = [[NSNumber alloc] initWithInt:1000000];
    [dictionary setValue:number forKey:@"pastCount"];
    
    //plistの書き込み
    [dictionary writeToFile:listPath atomically:YES];
    counter.text = [NSString stringWithFormat:@"%@", number];
    
    brokenPhone.hidden = YES;
    brokendPhone.hidden = YES;
    counter.hidden = NO;
    restart.hidden = YES;
    [screenBtn setEnabled:YES];
    [restartBtn setEnabled:NO];
    
    
}
///////////////////////restartボタンend//////////////////////////////////////////////


///////////////////////sound選択画面遷移ボタンstart////////////////////////////////////
-(IBAction)MoveToSound:(id)sender{
    
    SoundViewController *sound = [[SoundViewController alloc] initWithNibName:@"SoundViewController" bundle:nil];
    [self presentViewController:sound animated:YES completion:nil];
}
///////////////////////soundボタンend////////////////////////////////////////////////
-(IBAction)TweetButton:(id)sender;{
    // Create an account store object.
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    
    // Create an account type that ensures Twitter accounts are retrieved.
    ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    
    [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error)
     {
         if (!granted) {
             NSLog(@"ユーザーがアクセスを拒否しました。");
         }else{
             NSLog(@"ユーザーがアクセスを許可しました。");
         }
     }];
    
    SLComposeViewController *twitterPostVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [twitterPostVC setInitialText:[NSString stringWithFormat:@"携帯を%d回叩いた。 you tauched the phone %d times #https://itunes.apple.com/us/app/one-million-phones/id862912736 ", countNumber ,countNumber]];
    [self presentViewController:twitterPostVC animated:YES completion:nil];
}


@end





