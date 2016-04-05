//
//  MainViewController.m
//  PopTest
//
//  Created by babykang on 16/3/26.
//  Copyright © 2016年 wangkang. All rights reserved.
//

#import "MainViewController.h"
#import <POP/POP.h>


@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
@property (weak, nonatomic) IBOutlet UISlider *springSpeedSlider;
@property (weak, nonatomic) IBOutlet UISlider *springBouncinessSlider;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation MainViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        
    }
    return self;
}

- (IBAction)tapGesturePerformed:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        [self performAnimation];
    }
}
- (IBAction)buttonPress:(UIButton *)sender {
    [self performAnimation];
}



- (void)performAnimation
{
    self.tapGesture.enabled = NO;
    
    // First let's remove any existing animations
    CALayer *layer = self.label.layer;
    
    [layer pop_removeAllAnimations];
    
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anim.fromValue = @(100);
    anim.toValue = @(500);
    anim.springBounciness = self.springBouncinessSlider.value;
    anim.springSpeed = self.springSpeedSlider.value;
    
    
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"Animation has completed.");
        self.tapGesture.enabled = YES;
    };
    
    [layer pop_addAnimation:anim forKey:@"size"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (IBAction)springSpeedSliderUpdated:(UISlider *)sender
{
    UILabel *label = (UILabel *)[self.view viewWithTag:20];
    label.text = [NSString stringWithFormat:@"Spring Speed: %f", sender.value];
}

- (IBAction)springBouncinessSliderUpdated:(UISlider *)sender
{
    UILabel *label = (UILabel *)[self.view viewWithTag:30];
    label.text = [NSString stringWithFormat:@"Spring Bounciness: %f", sender.value];
}

@end
