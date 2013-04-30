#import "ACFFontViewController.h"

#define FONT_SIZE_DEFAULT  25

#define FONT_NAME_ROW      0
#define FONT_SIZE_ROW      1

@implementation ACFFontViewController {
    NSMutableArray *_fontNames;
    UIStepper *_fontNameStepper;
    UIStepper *_fontSizeStepper;
}

#pragma mark - NSObject

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Create a custom `titleLabel`.
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320-10, 44)];
        titleLabel.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont fontWithName:[UIFont fontNamesForFamilyName:[UIFont familyNames][0]][0] size:FONT_SIZE_DEFAULT];
        titleLabel.shadowColor = [UIColor colorWithWhite:0 alpha:0.5];
        titleLabel.text = [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"] lowercaseString]; // Fontful
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        self.navigationItem.titleView = titleLabel;

        NSLog(@"Font family names: %@", [UIFont familyNames]);
        NSLog(@"%@ font names: %@", [UIFont familyNames][0], [UIFont fontNamesForFamilyName:[UIFont familyNames][0]]);
    }
    return self;
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = YES;

    self.tableView.rowHeight = 52;

    _fontNames = [NSMutableArray array];
    for (NSString *fontFamilyName in [UIFont familyNames]) {
        [_fontNames addObjectsFromArray:[UIFont fontNamesForFamilyName:fontFamilyName]];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryView = [[UIStepper alloc] init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    switch (indexPath.row) {
        case FONT_NAME_ROW:
            if (!_fontNameStepper) {
                _fontNameStepper = [[UIStepper alloc] init];
                _fontNameStepper.maximumValue = [_fontNames count]-1;
                _fontNameStepper.minimumValue = 0;
                [_fontNameStepper addTarget:self action:@selector(updateFont) forControlEvents:UIControlEventValueChanged];
            }
            cell.accessoryView = _fontNameStepper;
            cell.detailTextLabel.text = _fontNames[(NSInteger)_fontNameStepper.value];
            cell.textLabel.text = NSLocalizedString(@"Name", nil);
            break;
        case FONT_SIZE_ROW:
            if (!_fontSizeStepper) {
                _fontSizeStepper = [[UIStepper alloc] init];
                _fontSizeStepper.minimumValue = 0;
                _fontSizeStepper.value = FONT_SIZE_DEFAULT;
                [_fontSizeStepper addTarget:self action:@selector(updateFont) forControlEvents:UIControlEventValueChanged];
            }
            cell.accessoryView = _fontSizeStepper;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", _fontSizeStepper.value];
            cell.textLabel.text = NSLocalizedString(@"Size", nil);
            break;
    }

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return NSLocalizedString(@"Font", nil);
}

#pragma mark - Actions

- (void)updateFont
{
    NSString *fontName = _fontNames[(NSInteger)_fontNameStepper.value];
    CGFloat fontSize = _fontSizeStepper.value;
    UILabel *titleLabel = (UILabel *)self.navigationItem.titleView;
    titleLabel.font = [UIFont fontWithName:fontName size:fontSize];

    UITableViewCell *cell;
    cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    cell.detailTextLabel.text = fontName;
    cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", fontSize];

    NSLog(@"Font name: %@", fontName);
    NSLog(@"Font size: %f", fontSize);
}

@end
