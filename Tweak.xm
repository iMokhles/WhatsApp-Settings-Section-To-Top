@interface WAStaticTableViewController : UITableViewController
{
    NSMutableArray *_sections;
}

@property(retain, nonatomic) NSArray *sections; // @synthesize sections=_sections;
- (void)deselectActiveCell;
- (void)wa_fontSizeDidChange;
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 willSelectRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 titleForFooterInSection:(int)arg2;
- (id)tableView:(id)arg1 titleForHeaderInSection:(int)arg2;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (int)tableView:(id)arg1 numberOfRowsInSection:(int)arg2;
- (int)numberOfSectionsInTableView:(id)arg1;
- (id)rowAtIndexPath:(id)arg1;
- (id)addSection;
- (void)setupTableView;
- (void)viewDidLoad;
- (id)initWithStyle:(int)arg1;

@end

@interface WAStaticTableViewController (WAEnhancer8)
- (WATableSection *)addSectionAtTop;
@end

%hook WAStaticTableViewController
%new
- (WATableSection *)addSectionAtTop {
    WATableSection *waeTableSection = [[objc_getClass("WATableSection") alloc] init];
    NSMutableArray *sectionsStatic = MSHookIvar<NSMutableArray *>(self, "_sections");
    [sectionsStatic insertObject:waeTableSection atIndex:0];
    return waeTableSection;
}
%end