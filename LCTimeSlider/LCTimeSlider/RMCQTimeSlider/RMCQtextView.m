//
//  RMCQtextView.m
//  ViewClient
//
//  Created by 刘超 on 14-5-4.
//
//

#import "RMCQtextView.h"

@implementation RMCQtextView
@synthesize labelFontWidth;
@synthesize laelFontHeight;
@synthesize labelColor;
@synthesize title;
- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
		
		self.labelFontWidth=[NSFont systemFontOfSize:10.0f];
        self.laelFontHeight=[NSFont systemFontOfSize:5.0f];
        self.labelColor= [NSColor whiteColor];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
	CGContextRef myContext=[[NSGraphicsContext currentContext]graphicsPort];
    CGContextSetFillColorWithColor(myContext, [[NSColor grayColor] CGColor]);
    CGContextFillRect(myContext,CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
	NSPoint point;
	point.x=0;//self.frame.size.width/2;
	point.y=0;
    [self drawSliderLablesStartpoint:point LableWidth:self.frame.size.width LableTitle:self.title];
    
}
-(void)setStringValue:(NSString*)atitle{
	self.title=atitle;
	[self setNeedsDisplay:YES];
}
-(void)drawSliderLablesStartpoint:(NSPoint)point LableWidth:(float)scaleWidth LableTitle:(NSString*)atitle{
    
    NSDictionary*attributes=@{NSFontAttributeName:self.labelFontWidth,NSForegroundColorAttributeName:self.labelColor};
    CGRect labelLocation=CGRectMake(point.x, point.y, [self widthOfString:title withFont:self.labelFontWidth], [self widthOfString:title withFont:self.laelFontHeight]);
	NSRect rect=self.bounds;
    [atitle drawInRect:rect withAttributes:attributes];
}
- (CGFloat) widthOfString:(NSString *)string withFont:(NSFont*)font {
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    return [[[NSAttributedString alloc] initWithString:string attributes:attributes] size].width;
}
@end
