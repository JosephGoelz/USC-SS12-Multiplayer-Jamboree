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
@property int score;
@property int timer;
@property int level;
@property int timerFinal;
@property int ghostTimer;
@property UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UILabel * scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel * countdown;
@property (weak, nonatomic) IBOutlet UILabel * scoreTitle;
@property (weak, nonatomic) IBOutlet UILabel * timerTitle;
@property (weak, nonatomic) IBOutlet UILabel * ghostCountdown;
@property (weak, nonatomic) IBOutlet UIButton * Level1;
@property (weak, nonatomic) IBOutlet UIButton* Level2;
@property (weak, nonatomic) IBOutlet UIButton * Level3;
@property (weak, nonatomic) IBOutlet UIButton * Tap;

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
    
    _score = 0;
    _ghostTimer = 5;
    self.Tap.hidden = YES;
}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    if (_command != 1)
    {
        self.messageLabel.text = @"You did not swipe L!";
        _score--;
        NSString *intString = [NSString stringWithFormat:@"%d", _score];
        self.scoreLabel.text = intString;
    }
    else{
        _score++;
        if (_score > 0)
        {
            printf("score is greater than 0");
        }
        NSString *intString = [NSString stringWithFormat:@"%d", _score];
        self.scoreLabel.text = intString;
        //fprint(intString);
        [self playButtonPushed:self];
        
    }
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    if (_command != 0)
    {
        self.messageLabel.text = @"You did not swipe R!";
        _score--;
        NSString *intString = [NSString stringWithFormat:@"%d", _score];
        self.scoreLabel.text = intString;
    }
    else{
        _score++;
        NSString *intString = [NSString stringWithFormat:@"%d", _score];
        self.scoreLabel.text = intString;
        [self playButtonPushed:self];
    }
}

-(void)swipedown:(UISwipeGestureRecognizer*)gestureRecognizer
{
    if (_command != 3)
    {
        self.messageLabel.text = @"You did not swipe D!";
        _score--;
        NSString *intString = [NSString stringWithFormat:@"%d", _score];
        self.scoreLabel.text = intString;
    }
    else{
        _score++;
        NSString *intString = [NSString stringWithFormat:@"%d", _score];
        self.scoreLabel.text = intString;
        [self playButtonPushed:self];
    }
}

-(void)swipeup:(UISwipeGestureRecognizer*)gestureRecognizer
{
    if (_command != 2)
    {
        self.messageLabel.text = @"You did not swipe U!";
        _score--;
        NSString *intString = [NSString stringWithFormat:@"%d", _score];
        self.scoreLabel.text = intString;
    }
    else{
        _score++;
        NSString *intString = [NSString stringWithFormat:@"%d", _score];
        self.scoreLabel.text = intString;
        [self playButtonPushed:self];
    }
}

-(IBAction)playOneButtonPushed:(id)sender
{
    _timer = _timerFinal = 20;
    _level = 1;
    self.Level1.hidden = YES;
    self.Level2.hidden = YES;
    self.Level3.hidden = YES;
    self.Tap.hidden = NO;
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"CountDown.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    [self startCountdownGhost: self ];
}

-(IBAction)playTwoButtonPushed:(id)sender
{

    _timer = _timerFinal = 10;
    _level = 2;
    self.Level1.hidden = YES;
    self.Level2.hidden = YES;
    self.Level3.hidden = YES;
        self.Tap.hidden = NO;
    [self playButtonPushed:self];
}

-(IBAction)playThreeButtonPushed:(id)sender
{
    _timer = _timerFinal = 5;
    _level = 3;
    self.Level1.hidden = YES;
    self.Level2.hidden = YES;
    self.Level3.hidden = YES;
        self.Tap.hidden = NO;
    [self playButtonPushed:self];
}

-(IBAction)playButtonPushed:(id)sender
{
    _scoreLabel.text = @"Your score: ";
    _timerTitle.text = @"Timer: ";
   // _rando = arc4random_uniform(6);
    //printf("This is a neat command!\n");
    [self.view setBackgroundColor:[UIColor redColor] ];
    //printf("After setting color");
    while(true)
    {
        _rando = arc4random_uniform(6);
        //printf("in while loop");
        if (_rando == 0)
        {
            
            UIGraphicsBeginImageContext(self.view.frame.size);
            [[UIImage imageNamed:@"SwipeRight.png"] drawInRect:self.view.bounds];
            UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            self.view.backgroundColor = [UIColor colorWithPatternImage:image];
            
            self.messageLabel.text = @"";
            _command = 0;
            [self startCountdown:self];
        }
        else if (_rando == 1)
        {
            
            UIGraphicsBeginImageContext(self.view.frame.size);
            [[UIImage imageNamed:@"SwipeLeft.png"] drawInRect:self.view.bounds];
            UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            self.view.backgroundColor = [UIColor colorWithPatternImage:image];
            
            [self startCountdown:self];
            self.messageLabel.text = @"";
            _command = 1;
        }
        else if (_rando == 2)
        {
            
            UIGraphicsBeginImageContext(self.view.frame.size);
            [[UIImage imageNamed:@"SwipeUp.png"] drawInRect:self.view.bounds];
            UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            self.view.backgroundColor = [UIColor colorWithPatternImage:image];
            
            [self startCountdown:self];
            self.messageLabel.text = @"";
            _command = 2;
        }
        else if (_rando == 3)
        {
            
            UIGraphicsBeginImageContext(self.view.frame.size);
            [[UIImage imageNamed:@"SwipeDown.png"] drawInRect:self.view.bounds];
            UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            self.view.backgroundColor = [UIColor colorWithPatternImage:image];
            
            [self startCountdown:self];
            self.messageLabel.text = @"";
            _command = 3;
        }
        else if (_rando == 4)
        {
            UIGraphicsBeginImageContext(self.view.frame.size);
            [[UIImage imageNamed:@"ShakeScreen.png"] drawInRect:self.view.bounds];
            UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            self.view.backgroundColor = [UIColor colorWithPatternImage:image];
            
            [self startCountdown:self];
            self.messageLabel.text = @"";
            _command = 4;
        }
        else{
            UIGraphicsBeginImageContext(self.view.frame.size);
            [[UIImage imageNamed:@"TapScreen.png"] drawInRect:self.view.bounds];
            UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            self.view.backgroundColor = [UIColor colorWithPatternImage:image];
            
            [self startCountdown:self];
            self.messageLabel.text = @"";
            _score++;
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
            _score--;
            NSString *intString = [NSString stringWithFormat:@"%d", _score];
            self.scoreLabel.text = intString;
        }
        else{
            _score++;
            NSString *intString = [NSString stringWithFormat:@"%d", _score];
            self.scoreLabel.text = intString;
            [self playButtonPushed:self];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startCountdown:(id)sender
{
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(advanceTimer:) userInfo:nil repeats:NO];
}

- (void)advanceTimer:(NSTimer *)timer
{
    --_timer;
    if(self.timer <= 0)
    {
        _timer = _timerFinal;
        printf("Times Up");
    }
    else{
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(advanceTimer:) userInfo:nil repeats:NO];
    }
    NSString *intString = [NSString stringWithFormat:@"%d", _timer];
    
    _countdown.text = intString;
}

- (void)startCountdownGhost:(id)sender
{
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(advanceTimerGhost:) userInfo:nil repeats:NO];
}

- (void)advanceTimerGhost:(NSTimer *)timer
{
    --_ghostTimer;
    if(self.ghostTimer <= 0)
    {
        _ghostCountdown.text = @"";
        [self playButtonPushed:self];
    }
    else{
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(advanceTimerGhost:) userInfo:nil repeats:NO];
        NSString *intString = [NSString stringWithFormat:@"%d", _ghostTimer];
        
        _ghostCountdown.text = intString;
    }
}
@end
