//
//  RMCQtextView.h
//  ViewClient
//
//  Created by 刘超 on 14-5-4.
//
//

#import <Cocoa/Cocoa.h>

@interface RMCQtextView : NSView{
	
}
@property (nonatomic, strong) NSFont* labelFontWidth;
@property(nonatomic,strong)NSFont*laelFontHeight;
@property (nonatomic, strong) NSColor* labelColor;
@property(nonatomic,strong)NSString*title;
-(void)setStringValue:(NSString*)atitle;
@end
