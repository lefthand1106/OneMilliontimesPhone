//
//  SoundViewController.m
//  OneMilliontimesPhone
//
//  Created by 篠原正樹 on 2014/04/11.
//  Copyright (c) 2014年 masaki. All rights reserved.
//

#import "SoundViewController.h"

@interface SoundViewController ()

@end

@implementation SoundViewController

@synthesize sound1Button;
@synthesize sound2Button;
@synthesize sound3Button;
@synthesize muteButton;
@synthesize okButton;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSString *)docsDir {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// sound選択処理
- (IBAction)executeSound1:(id)sender
{
    AudioServicesPlaySystemSound (1002);  //効果音再生
    selectedSound = 1;
    
    //get path
    listPath = [[self docsDir] stringByAppendingPathComponent:@"count.plist"];

    
    dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:listPath];
    
    //from int to nsnumber
    sd = [[NSNumber alloc] initWithInt:selectedSound];
    
    //numberをcount.plistに格納
    [dictionary setValue:sd forKey:@"selectedS"];
    [dictionary writeToFile:listPath atomically:YES];
    
    }

- (IBAction)executeSound2:(id)sender
{
    AudioServicesPlaySystemSound (1003);  //効果音再生
    
    selectedSound = 2;
    
    //get path
    listPath = [[self docsDir] stringByAppendingPathComponent:@"count.plist"];
    
    
    dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:listPath];
    
    //from int to nsnumber
    sd = [[NSNumber alloc] initWithInt:selectedSound];
    
    //numberをcount.plistに格納
    [dictionary setValue:sd forKey:@"selectedS"];
    [dictionary writeToFile:listPath atomically:YES];
}

- (IBAction)executeSound3:(id)sender
{
    AudioServicesPlaySystemSound (1004);  //効果音再生
    
    selectedSound = 3;
    
    //get path
    listPath = [[self docsDir] stringByAppendingPathComponent:@"count.plist"];
    
    
    dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:listPath];
    
    //from int to nsnumber
    sd = [[NSNumber alloc] initWithInt:selectedSound];
    
    //numberをcount.plistに格納
    [dictionary setValue:sd forKey:@"selectedS"];
    [dictionary writeToFile:listPath atomically:YES];

}

// mute実行処理
- (IBAction)executeMute:(id) sender
{
    AudioServicesPlaySystemSound (1011);  //mute再生
    
    selectedSound = 4;
    
    //get path
    listPath = [[self docsDir] stringByAppendingPathComponent:@"count.plist"];
    
    
    dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:listPath];
    
    //from int to nsnumber
    sd = [[NSNumber alloc] initWithInt:selectedSound];
    
    //numberをcount.plistに格納
    [dictionary setValue:sd forKey:@"selectedS"];
    [dictionary writeToFile:listPath atomically:YES];

}

// home画面遷移実行処理
- (IBAction)executeOk:(id) sender
{
    [self dismissViewControllerAnimated:YES completion:NO];
    

}


@end
