
@implementation CAKeyframeAnimation (DockBounce)

+ (CAKeyframeAnimation *)dockBounceAnimationWithIconHeight:(CGFloat)iconHeight {
  CGFloat factors[32] = {0, 32, 60, 83, 100, 114, 124, 128, 128, 124, 114, 100, 83, 60, 32,
                               0, 24, 42, 54, 62, 64, 62, 54, 42, 24, 0, 18, 28, 32, 28, 18, 0};

  NSMutableArray *values = [NSMutableArray array];

  for (int i=0; i<32; i++)
  {
    CGFloat positionOffset = factors[i]/128.0f * iconHeight;

    //CATransform3D transform = CATransform3DMakeTranslation(0, , 0);
    [values addObject:[NSNumber numberWithFloat:-positionOffset]];
  }

  CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
  animation.repeatCount = 1;
  animation.duration = 32.0f/30.0f;
  animation.fillMode = kCAFillModeForwards;
  animation.values = values;
  animation.removedOnCompletion = YES; // final stage is equal to starting stage
  animation.autoreverses = NO;

  return animation;
}

@end
