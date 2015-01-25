//
//  ViewController.m
//  Boppit
//
//  Created by Emma Lautz on 1/24/15.
//  Copyright (c) 2015 Emma Lautz. All rights reserved.
//

#import "ViewController.h"
#import <stdlib.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel * messageLabel;
@property int rando;
@property int command;
@property UIImageView *backgroundView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
    
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    
    UISwipeGestureRecognizer * swipeup=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeup:)];
    swipeup.direction=UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeup];
    
    UISwipeGestureRecognizer * swipedown=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipedown:)];
    swipedown.direction=UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipedown];
}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    if (_command != 1)
    {
        self.messageLabel.text = @"You did not swipe L!";
    }
    else{
        [self playButtonPushed:self];
    }
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    if (_command != 0)
    {
        self.messageLabel.text = @"You did not swipe R!";
    }
    else{
        [self playButtonPushed:self];
    }
}

-(void)swipedown:(UISwipeGestureRecognizer*)gestureRecognizer
{
    if (_command != 3)
    {
        self.messageLabel.text = @"You did not swipe D!";
    }
    else{
        [self playButtonPushed:self];
    }
}

-(void)swipeup:(UISwipeGestureRecognizer*)gestureRecognizer
{
    if (_command != 2)
    {
        self.messageLabel.text = @"You did not swipe U!";
    }
    else{
        [self playButtonPushed:self];
    }
}

-(IBAction)playButtonPushed:(id)sender
{
   // _rando = arc4random_uniform(6);
    printf("This is a neat command!\n");
    [self.view setBackgroundColor:[UIColor redColor] ];
    printf("After setting color");
    while(true)
    {
        _rando = arc4random_uniform(6);
        printf("in while loop");
        if (_rando == 0)
        {
            self.messageLabel.text = @"Swipe Right!";
            _command = 0;
        }
        else if (_rando == 1)
        {
            self.messageLabel.text = @"Swipe Left!";
            _command = 1;
        }
        else if (_rando == 2)
        {
            self.messageLabel.text = @"Swipe Up!";
            _command = 2;
        }
        else if (_rando == 3)
        {
            self.messageLabel.text = @"Swipe Down!";
            _command = 3;
        }
        else if (_rando == 4)
        {
            UIGraphicsBeginImageContext(self.view.frame.size);
            [[UIImage imageNamed:@"ShakeScreen.png"] drawInRect:self.view.bounds];
            UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            self.view.backgroundColor = [UIColor colorWithPatternImage:image];
            
           /* _backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ShakeScreen"] ];
            [self.view addSubview:_backgroundView];
            */
            self.messageLabel.text = @"";
            _command = 4;
        }
        else{
            /*
            _backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TapScreen"]];
            [self.view addSubview:_backgroundView];
             */
            UIGraphicsBeginImageContext(self.view.frame.size);
            [[UIImage imageNamed:@"TapScreen.png"] drawInRect:self.view.bounds];
            UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            self.view.backgroundColor = [UIColor colorWithPatternImage:image];
            self.messageLabel.text = @"";
            _command = 5;
        }
        break;
    }
    
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    printf("in shake event");
    if (motion == UIEventSubtypeMotionShake)
    {
        if (_command != 4)
        {
            self.messageLabel.text = @"You did not shake!";
        }
        else{
            [self playButtonPushed:self];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
