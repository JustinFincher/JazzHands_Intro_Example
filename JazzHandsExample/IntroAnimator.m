//
//  IntroAnimator.m
//  baiyunwang
//
//  Created by JustZht on 15/7/11.
//  Copyright (c) 2015年 JustZht. All rights reserved.
//

#import "IntroAnimator.h"
#import "FBShimmering.h"
#import "FBShimmeringView.h"

@interface IntroAnimator ()

//记得在那个 解释加号按钮的地方 做成Keynote的大圆扩张动画

//全局按钮

@property (nonatomic, strong) UIImageView *LOGOICON;

@property (nonatomic, strong) UIButton *GoLoginOrSignUpButton;
@property (nonatomic, strong) UIButton *SkipLoginOrSignUpButton;
@property (nonatomic, strong) UILabel *Flame1WelcomeLabel;
@property (nonatomic, strong) FBShimmeringView *SlideToBeginView;
@property (nonatomic, strong) UILabel *Flame1SlideLabel;
@property (nonatomic, strong) UIImageView *Flame2iPhoneImage;
@property (nonatomic, strong) UILabel *Flame2IntroLabel;
@property (nonatomic, strong) UILabel *Flame2DetailLabel;
@property (nonatomic, strong) UIImageView *Flame3CardImage;
@property (nonatomic, strong) UILabel *Flame3IntroLabel;
@property (nonatomic, strong) UILabel *Flame3DetailLabel;
@property (nonatomic, strong) UIImageView *Flame4PublishPlusICON;
@property (nonatomic, strong) UIImageView *Flame4PublishButton;
@property (nonatomic, strong) CAShapeLayer*PublishShape;
@property (nonatomic, strong) UIView*PublishShapeContainerView;
@property (nonatomic, strong) UILabel *Flame4IntroLabel;
@property (nonatomic, strong) UILabel *Flame4DetailLabel;
@property (nonatomic, strong) UIImageView *Flame5DeviceImage;
@property (nonatomic, strong) UILabel *Flame5IntroLabel;
@property (nonatomic, strong) UILabel *Flame5DetailLabel;
@property (nonatomic, strong) UILabel *Flame6DetailLabel;
@property (nonatomic, strong) UIImageView *Flame6rightImage;
//



@end

@implementation IntroAnimator
//SYNTHESIZE

//大Button
@synthesize GoLoginOrSignUpButton,SkipLoginOrSignUpButton;

//页面一
@synthesize Flame1WelcomeLabel,SlideToBeginView,Flame1SlideLabel,Flame2DetailLabel,LOGOICON;

//页面二
@synthesize Flame2iPhoneImage,Flame2IntroLabel;

//3
@synthesize Flame3CardImage,Flame3DetailLabel,Flame3IntroLabel;

//4
@synthesize Flame4PublishButton,Flame4PublishPlusICON,PublishShape,PublishShapeContainerView,Flame4DetailLabel,Flame4IntroLabel;

//5
@synthesize Flame5DeviceImage,Flame5DetailLabel,Flame5IntroLabel;

//6
@synthesize Flame6DetailLabel,Flame6rightImage;

- (instancetype)init
{
    if ((self = [super init])) {
        self.numberOfPages = 6;
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        self.numberOfPages = 6;
    }
    
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        self.numberOfPages = 6;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    
    [self configureScrollViewAnimations];
    [self configureFirstViews];
    [self configureViews];
    [self configureAnimations];
}

- (void)IntroLogin
{
    UIViewController *VC = self.presentingViewController.childViewControllers.lastObject;
    if ([VC isKindOfClass:[UINavigationController class]]) {
        
        [self dismissViewControllerAnimated:YES completion:^(void){
            [VC.childViewControllers.lastObject performSegueWithIdentifier:@"PersonalToLogin"
                                                                    sender:self];
        }];
    }
}

- (void)IntroBack
{
    [self dismissViewControllerAnimated:YES completion:^(void){}];
}

- (void)configureFirstViews
{
    UIInterpolatingMotionEffect *verticalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.y"
     type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalMotionEffect.minimumRelativeValue = @(-25);
    verticalMotionEffect.maximumRelativeValue = @(25);
    
    // Set horizontal effect
    UIInterpolatingMotionEffect *horizontalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.x"
     type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalMotionEffect.minimumRelativeValue = @(-25);
    horizontalMotionEffect.maximumRelativeValue = @(25);
    
    // Create group to combine both
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];
    
    Flame1WelcomeLabel = [[UILabel alloc]init];
    Flame1WelcomeLabel.text = @"欢迎使用E运达";
    Flame1WelcomeLabel.textAlignment = NSTextAlignmentCenter;
    Flame1WelcomeLabel.textColor = [UIColor whiteColor];
    [Flame1WelcomeLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:40]];
    [self.contentView addSubview:Flame1WelcomeLabel];
    
    SlideToBeginView = [[FBShimmeringView alloc]init];
    SlideToBeginView.shimmering = YES;
    [self.contentView addSubview:SlideToBeginView];
    
    Flame1SlideLabel = [[UILabel alloc]init];
    Flame1SlideLabel.text = @"向右滑动开始";
    Flame1SlideLabel.textAlignment = NSTextAlignmentCenter;
    Flame1SlideLabel.textColor = [UIColor whiteColor];
    [Flame1SlideLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:25]];
    SlideToBeginView.contentView = Flame1SlideLabel;
    
    // Add both effects to your view
    [SlideToBeginView addMotionEffect:group];
    [Flame1WelcomeLabel addMotionEffect:group];
    
    LOGOICON = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iconWHITE"]];
    [self.contentView addSubview:LOGOICON];
    [LOGOICON addMotionEffect:group];

    
}
- (void)configureViews
{
    
    GoLoginOrSignUpButton = [[UIButton alloc] init];
    GoLoginOrSignUpButton.backgroundColor = [UIColor whiteColor];
    GoLoginOrSignUpButton.layer.cornerRadius = 4;
    GoLoginOrSignUpButton.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    GoLoginOrSignUpButton.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移
    GoLoginOrSignUpButton.layer.shadowOpacity = 0.2;//阴影透明度，默认0
    GoLoginOrSignUpButton.layer.shadowRadius = 3;//阴影半径，默认3
    GoLoginOrSignUpButton.layer.masksToBounds = NO;
    [GoLoginOrSignUpButton setTitle:@"登录/注册" forState:UIControlStateNormal];
    [GoLoginOrSignUpButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [GoLoginOrSignUpButton addTarget:self action:@selector(IntroLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:GoLoginOrSignUpButton];

    SkipLoginOrSignUpButton = [[UIButton alloc] init];
    SkipLoginOrSignUpButton.backgroundColor = [UIColor whiteColor];
    SkipLoginOrSignUpButton.layer.cornerRadius = 4;
    SkipLoginOrSignUpButton.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    SkipLoginOrSignUpButton.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移
    SkipLoginOrSignUpButton.layer.shadowOpacity = 0.2;//阴影透明度，默认0
    SkipLoginOrSignUpButton.layer.shadowRadius = 3;//阴影半径，默认3
    SkipLoginOrSignUpButton.layer.masksToBounds = NO;
    [SkipLoginOrSignUpButton setTitle:@"直接进入" forState:UIControlStateNormal];
    [SkipLoginOrSignUpButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [SkipLoginOrSignUpButton addTarget:self action:@selector(IntroBack) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:SkipLoginOrSignUpButton];
    
    Flame2iPhoneImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iPhone"]];
    [self.contentView addSubview:Flame2iPhoneImage];
    
    Flame2IntroLabel = [[UILabel alloc]init];
    Flame2IntroLabel.text = @"E运达，致力于";
    Flame2IntroLabel.textAlignment = NSTextAlignmentCenter;
    Flame2IntroLabel.textColor = [UIColor whiteColor];
    [Flame2IntroLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:40]];
    [self.contentView addSubview:Flame2IntroLabel];
    
    Flame2DetailLabel = [[UILabel alloc]init];
    Flame2DetailLabel.text = @"全国领先的物流信息平台";
    Flame2DetailLabel.textAlignment = NSTextAlignmentCenter;
    Flame2DetailLabel.textColor = [UIColor whiteColor];
    [Flame2DetailLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:20]];
    [self.contentView addSubview:Flame2DetailLabel];
    
    Flame3CardImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IntroInfoCard"]];
    [self.contentView addSubview:Flame3CardImage];
    
    Flame3IntroLabel = [[UILabel alloc]init];
    Flame3IntroLabel.text = @"查看货源车源";
    Flame3IntroLabel.textAlignment = NSTextAlignmentCenter;
    Flame3IntroLabel.textColor = [UIColor whiteColor];
    [Flame3IntroLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:40]];
    [self.contentView addSubview:Flame3IntroLabel];
    
    Flame3DetailLabel = [[UILabel alloc]init];
    Flame3DetailLabel.text = @"手机展示 高效便捷";
    Flame3DetailLabel.textAlignment = NSTextAlignmentCenter;
    Flame3DetailLabel.textColor = [UIColor whiteColor];
    [Flame3DetailLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:20]];
    [self.contentView addSubview:Flame3DetailLabel];

    Flame4PublishPlusICON = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IntoPublishPlusiCON"]];
    [self.contentView addSubview:Flame4PublishPlusICON];
    Flame4PublishButton = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IntroPublishButton"]];
    [self.contentView addSubview:Flame4PublishButton];
    
    UIBezierPath* CirclePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 11) radius:20 startAngle:0 endAngle:2*M_PI clockwise:YES];
    PublishShape = [CAShapeLayer layer];
    PublishShape.path = CirclePath.CGPath;
    PublishShape.fillColor = [UIColor colorWithRed:255.0/255.0 green:38.0/255.0 blue:120.0/255.0 alpha:1.0].CGColor;
    
    PublishShapeContainerView = [[UIView alloc]init];
    [[self.PublishShapeContainerView layer] addSublayer:PublishShape];
    [self.contentView addSubview:PublishShapeContainerView];
    
    [self.contentView sendSubviewToBack:PublishShapeContainerView];
    [self.contentView sendSubviewToBack:Flame2iPhoneImage];
    
    Flame4IntroLabel = [[UILabel alloc]init];
    Flame4IntroLabel.text = @"发布货物和车辆";
    Flame4IntroLabel.textAlignment = NSTextAlignmentCenter;
    Flame4IntroLabel.textColor = [UIColor whiteColor];
    [Flame4IntroLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:40]];
    [self.contentView addSubview:Flame4IntroLabel];
    
    Flame4DetailLabel = [[UILabel alloc]init];
    Flame4DetailLabel.text = @"一键发布 快速应答";
    Flame4DetailLabel.textAlignment = NSTextAlignmentCenter;
    Flame4DetailLabel.textColor = [UIColor whiteColor];
    [Flame4DetailLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:20]];
    [self.contentView addSubview:Flame4DetailLabel];

    Flame5DeviceImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"introDevices"]];
    [self.contentView addSubview:Flame5DeviceImage];
    
    Flame5IntroLabel = [[UILabel alloc]init];
    Flame5IntroLabel.text = @"全面互联";
    Flame5IntroLabel.textAlignment = NSTextAlignmentCenter;
    Flame5IntroLabel.textColor = [UIColor whiteColor];
    [Flame5IntroLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:40]];
    [self.contentView addSubview:Flame5IntroLabel];
    
    Flame5DetailLabel = [[UILabel alloc]init];
    Flame5DetailLabel.text = @"多终端物流平台";
    Flame5DetailLabel.textAlignment = NSTextAlignmentCenter;
    Flame5DetailLabel.textColor = [UIColor whiteColor];
    [Flame5DetailLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:20]];
    [self.contentView addSubview:Flame5DetailLabel];

    Flame6DetailLabel = [[UILabel alloc]init];
    NSString *LASTSTING = @"现在登录或注册即可使用\n包括发布在内的所有功能";
    Flame6DetailLabel.text = LASTSTING;
    Flame6DetailLabel.numberOfLines = 0;
    Flame6DetailLabel.textAlignment = NSTextAlignmentCenter;
    Flame6DetailLabel.textColor = [UIColor whiteColor];
    [Flame6DetailLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [Flame6DetailLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:16]];
    [self.contentView addSubview:Flame6DetailLabel];
    
    Flame6rightImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"introright"]];
    [self.contentView addSubview:Flame6rightImage];
    


}

- (void)configureAnimations
{   //all
    [self configureScrollViewAnimations];
    //last
    [self configureGoLoginOrSignUpButtonAnimations];
    [self configureSkipLoginOrSignUpButtonAnimations];
    //1
    [self configureFlame1WelcomeLabelAnimations];
    [self configureSlideToBeginViewAnimations];
    //2
    [self configureFlame2iPhoneImageAnimations];
    [self configureFlame2IntroLabelAnimations];
    
    //3
    [self configureFlame3IntroLabelAnimations];
    [self configureFlame3InfoCardAnimations];
    
    //4
    [self configureFlame4iPhoneImageAnimations];
    [self configureFlame4PUBLISHImageAnimations];
    [self configureFlame4PUBLISHLayerAnimations];
    [self configureFlame4IntroLabelAnimations];
    
    //5
    [self configureFlame5DeviceImageAnimations];
    [self configureFlame5IntroLabelAnimations];
    
    //6
    [self configureFlame5PUBLISHLayerAnimations];
    [self configureFlame6IntroLabelAnimations];
}
- (void)configureFlame6IntroLabelAnimations
{
    [self keepView:self.Flame6DetailLabel
           onPages:@[ @(5) ]
           atTimes:@[ @(5) ]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.Flame6DetailLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-150.0f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.Flame6DetailLabel
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:0.0f
                                                                  constant:65.0f]];
    
    [self keepView:self.Flame6rightImage
           onPages:@[ @(5) ]
           atTimes:@[ @(5) ]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.Flame6rightImage
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-295.0f]];
    
}
- (void)configureFlame5PUBLISHLayerAnimations
{
    IFTTTFillColorAnimation *Flame5PUBLISHLayerFillColorTranslationAnimation = [IFTTTFillColorAnimation animationWithLayer:PublishShape];
    [Flame5PUBLISHLayerFillColorTranslationAnimation addKeyframeForTime:4 color:[UIColor colorWithRed:255.0/255.0 green:38.0/255.0 blue:120.0/255.0 alpha:1.0]];
    [Flame5PUBLISHLayerFillColorTranslationAnimation addKeyframeForTime:4.5 color:[UIColor yellowColor]];
    [Flame5PUBLISHLayerFillColorTranslationAnimation addKeyframeForTime:5 color:[UIColor colorWithRed:0/255.0 green:255.0/255.0 blue:168.0/255.0 alpha:1.0]];
    [self.animator addAnimation:Flame5PUBLISHLayerFillColorTranslationAnimation];
    
}

- (void)configureFlame5IntroLabelAnimations
{
    [self keepView:self.Flame5IntroLabel
           onPages:@[ @(4) ]
           atTimes:@[ @(4) ]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.Flame5IntroLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-176.0f]];
    [self keepView:self.Flame5DetailLabel
           onPages:@[ @(4) ]
           atTimes:@[ @(4) ]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.Flame5DetailLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-150.0f]];

}
- (void)configureFlame5DeviceImageAnimations
{
    [self keepView:self.Flame5DeviceImage
           onPages:@[@(3),@(4),@(5)  ]
           atTimes:@[@(3),@(4),@(5)  ]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.Flame5DeviceImage
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-380.0]];
    
    IFTTTAlphaAnimation *Flame5DeviceImageAlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.Flame5DeviceImage];
    [Flame5DeviceImageAlphaAnimation addKeyframeForTime:3 alpha:0.f];
    [Flame5DeviceImageAlphaAnimation addKeyframeForTime:4 alpha:1.f];
    [Flame5DeviceImageAlphaAnimation addKeyframeForTime:5 alpha:0.f];
    [self.animator addAnimation:Flame5DeviceImageAlphaAnimation];
}
- (void)configureFlame4IntroLabelAnimations
{
    [self keepView:self.Flame4IntroLabel
           onPages:@[ @(3) ]
           atTimes:@[ @(3) ]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.Flame4IntroLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-116.0f]];
    
    [self keepView:self.Flame4DetailLabel
           onPages:@[ @(3) ]
           atTimes:@[ @(3) ]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.Flame4DetailLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-90.0f]];

}
- (void)configureFlame4PUBLISHLayerAnimations
{
    [self keepView:self.PublishShapeContainerView
           onPages:@[ @(2),@(3),@(4),@(5)  ]
           atTimes:@[ @(2),@(3),@(4),@(5)  ]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.PublishShapeContainerView
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-400.0f]];
    IFTTTAlphaAnimation *PublishShapeContainerAlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.PublishShapeContainerView];
    [PublishShapeContainerAlphaAnimation addKeyframeForTime:2 alpha:0.f];
    [PublishShapeContainerAlphaAnimation addKeyframeForTime:3 alpha:1.f];
    [self.animator addAnimation:PublishShapeContainerAlphaAnimation];
    
    IFTTTScaleAnimation *PublishShapeContainerTranslationAnimation = [IFTTTScaleAnimation animationWithView:self.PublishShapeContainerView];
    [PublishShapeContainerTranslationAnimation addKeyframeForTime:3 scale:1.0f];
    [PublishShapeContainerTranslationAnimation addKeyframeForTime:4 scale:45.0f];
    [PublishShapeContainerTranslationAnimation addKeyframeForTime:5 scale:5.0f];
    [self.animator addAnimation:PublishShapeContainerTranslationAnimation];
}
- (void)configureFlame4PUBLISHImageAnimations
{
    [self keepView:self.Flame4PublishPlusICON
           onPages:@[ @(2),@(3),@(4)  ]
           atTimes:@[ @(2),@(3),@(4)  ]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.Flame4PublishPlusICON
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-380.0]];
    [self keepView:self.Flame4PublishButton
           onPages:@[ @(2),@(3),@(4) ]
           atTimes:@[ @(2),@(3),@(4)  ]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.Flame4PublishButton
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-380.0f]];

    IFTTTAlphaAnimation *PublishButtonAlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.Flame4PublishButton];
    [PublishButtonAlphaAnimation addKeyframeForTime:2 alpha:0.f];
    [PublishButtonAlphaAnimation addKeyframeForTime:3 alpha:1.f];
    [PublishButtonAlphaAnimation addKeyframeForTime:3.2 alpha:0.f];
    [self.animator addAnimation:PublishButtonAlphaAnimation];
    IFTTTAlphaAnimation *PublishPlusICONAlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.Flame4PublishPlusICON];
    [PublishPlusICONAlphaAnimation addKeyframeForTime:2 alpha:0.f];
    [PublishPlusICONAlphaAnimation addKeyframeForTime:3 alpha:1.f];
    [PublishPlusICONAlphaAnimation addKeyframeForTime:3.2 alpha:0.f];
    [self.animator addAnimation:PublishPlusICONAlphaAnimation];
}
- (void)configureFlame4iPhoneImageAnimations
{
    IFTTTTranslationAnimation *iPhoneUPTranslationAnimation = [IFTTTTranslationAnimation animationWithView:self.Flame2iPhoneImage];
    [iPhoneUPTranslationAnimation addKeyframeForTime:2 translation:CGPointMake(0, 0)];
    [iPhoneUPTranslationAnimation addKeyframeForTime:3 translation:CGPointMake(0, -420)];
    [self.animator addAnimation:iPhoneUPTranslationAnimation];
}

- (void)configureFlame3IntroLabelAnimations{
    [self keepView:self.Flame3IntroLabel
           onPages:@[ @(2) ]
           atTimes:@[ @(2) ]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.Flame3IntroLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-416.0f]];
    
    [self keepView:self.Flame3DetailLabel
           onPages:@[ @(2) ]
           atTimes:@[ @(2) ]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.Flame3DetailLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-390.0f]];
}
- (void)configureFlame3InfoCardAnimations
{
    [self keepView:self.Flame3CardImage
           onPages:@[ @(1) , @(2) , @(3)]
           atTimes:@[ @(1) , @(2) , @(3)]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.Flame3CardImage
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:0.0f]];
    IFTTTAlphaAnimation *InfoCardAlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.Flame3CardImage];
    [InfoCardAlphaAnimation addKeyframeForTime:1 alpha:0.f];
    [InfoCardAlphaAnimation addKeyframeForTime:2 alpha:1.f];
    [InfoCardAlphaAnimation addKeyframeForTime:3 alpha:0.f];
    [self.animator addAnimation:InfoCardAlphaAnimation];
    
    IFTTTTranslationAnimation *InfoCardTranslationAnimation = [IFTTTTranslationAnimation animationWithView:self.Flame3CardImage];
    [InfoCardTranslationAnimation addKeyframeForTime:1 translation:CGPointMake(0, 0)];
    [InfoCardTranslationAnimation addKeyframeForTime:2 translation:CGPointMake(0, -140)];
    [InfoCardTranslationAnimation addKeyframeForTime:3 translation:CGPointMake(0, -500)];
    [self.animator addAnimation:InfoCardTranslationAnimation];

    

}
- (void)configureFlame2IntroLabelAnimations
{
    [self keepView:self.Flame2IntroLabel
           onPages:@[ @(1) ]
           atTimes:@[ @(1) ]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.Flame2IntroLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-416.0f]];

    [self keepView:self.Flame2DetailLabel
           onPages:@[ @(1) ]
           atTimes:@[ @(1) ]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.Flame2DetailLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-390.0f]];

}
- (void)configureFlame2iPhoneImageAnimations
{
    [self keepView:self.Flame2iPhoneImage
           onPages:@[ @(1) , @(2) , @(3),@(4)]
           atTimes:@[ @(1) , @(2) , @(3),@(4)]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.Flame2iPhoneImage
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:150.0f]];
}

- (void)configureSlideToBeginViewAnimations
{
    [self keepView:self.SlideToBeginView
           onPages:@[ @(0) ]
           atTimes:@[ @(0) ]];

    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.SlideToBeginView
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:0.0f
                                                                  constant:80.0f]];

    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.SlideToBeginView
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:0.0f
                                                                  constant:(self.view.bounds.size.width - 40)]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.SlideToBeginView
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-60.0f]];
}


- (void)configureFlame1WelcomeLabelAnimations
{
    [self keepView:self.Flame1WelcomeLabel
           onPages:@[ @(0) ]
           atTimes:@[ @(0) ]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.Flame1WelcomeLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-120.0f]];
    
    [self keepView:self.LOGOICON
           onPages:@[ @(0) ]
           atTimes:@[ @(0) ]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.LOGOICON
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0f
                                                                  constant:160.0f]];
}

- (void)configureSkipLoginOrSignUpButtonAnimations
{
    [self keepView:self.SkipLoginOrSignUpButton
           onPages:@[ @(4) , @(5) ]
           atTimes:@[ @(4) , @(5) ]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.SkipLoginOrSignUpButton
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:0.0f constant:(self.view.bounds.size.width - 40)]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.SkipLoginOrSignUpButton
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:0.0f constant:60.0f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.SkipLoginOrSignUpButton
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f constant:130]];
    
    IFTTTTranslationAnimation *SkipLoginOrSignUpButtonTranslationAnimation = [IFTTTTranslationAnimation animationWithView:self.SkipLoginOrSignUpButton];
    [SkipLoginOrSignUpButtonTranslationAnimation addKeyframeForTime:4 translation:CGPointMake(0, 0)];
    [SkipLoginOrSignUpButtonTranslationAnimation addKeyframeForTime:5 translation:CGPointMake(0, -150)];
    [self.animator addAnimation:SkipLoginOrSignUpButtonTranslationAnimation];
}

- (void)configureGoLoginOrSignUpButtonAnimations
{
    [self keepView:self.GoLoginOrSignUpButton
           onPages:@[ @(0), @(1), @(2), @(3), @(4) , @(5) ]
           atTimes:@[ @(0), @(1), @(2), @(3), @(4) , @(5) ]];
    

    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.GoLoginOrSignUpButton
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:0.0f constant:(self.view.bounds.size.width - 40)]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.GoLoginOrSignUpButton
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:0.0f constant:60.0f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.GoLoginOrSignUpButton
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f constant:61]];

    
    IFTTTTranslationAnimation *GoLoginOrSignUpButtonTranslationAnimation = [IFTTTTranslationAnimation animationWithView:self.GoLoginOrSignUpButton];
    [GoLoginOrSignUpButtonTranslationAnimation addKeyframeForTime:4 translation:CGPointMake(0, 0)];
    [GoLoginOrSignUpButtonTranslationAnimation addKeyframeForTime:5 translation:CGPointMake(0, -150)];
    [self.animator addAnimation:GoLoginOrSignUpButtonTranslationAnimation];

}

- (void)configureScrollViewAnimations
{
    // change the scrollView's background color for each page
    IFTTTColorAnimation *backgroundColorAnimation = [IFTTTColorAnimation animationWithView:self.scrollView];
    [backgroundColorAnimation addKeyframeForTime:0 color:[[UIColor colorWithRed:38.0/255.0 green:172.0/255.0 blue:255.0/255.0 alpha:1.0f] colorWithAlphaComponent:1.0f]];
    [backgroundColorAnimation addKeyframeForTime:1 color:[[UIColor colorWithRed:38.0/255.0 green:172.0/255.0 blue:255.0/255.0 alpha:1.0f] colorWithAlphaComponent:1.0f]];
    [backgroundColorAnimation addKeyframeForTime:2 color:[[UIColor colorWithRed:38.0/255.0 green:172.0/255.0 blue:255.0/255.0 alpha:1.0f] colorWithAlphaComponent:1.0f]];
    [backgroundColorAnimation addKeyframeForTime:3 color:[[UIColor colorWithRed:38.0/255.0 green:172.0/255.0 blue:255.0/255.0 alpha:1.0f] colorWithAlphaComponent:1.0f]];
    [backgroundColorAnimation addKeyframeForTime:4 color:[[UIColor colorWithRed:38.0/255.0 green:172.0/255.0 blue:255.0/255.0 alpha:1.0f] colorWithAlphaComponent:1.0f]];
    [backgroundColorAnimation addKeyframeForTime:5 color:[[UIColor colorWithRed:38.0/255.0 green:172.0/255.0 blue:255.0/255.0 alpha:1.0f] colorWithAlphaComponent:1.0f]];
    [self.animator addAnimation:backgroundColorAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
