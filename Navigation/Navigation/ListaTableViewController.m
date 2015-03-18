//
//  ListaTableViewController.m
//  Navigation
//
//  Created by Kaique Damato on 3/18/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "ListaTableViewController.h"
#import "Dicionario.h"
#import "Letra.h"

@interface ListaTableViewController () {
    Dicionario *dicionario;
    Letra *letra;
}

@end

@implementation ListaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dicionario = [Dicionario sharedInstance];
    self.tableView.contentInset = UIEdgeInsetsMake(15, 0, 49, 0);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [dicionario.dicionario count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celula"];
    
    letra = dicionario.dicionario[indexPath.row];
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 40, 40)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 15, 90, 20)];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(70, 15, 90, 20)];
    image.image = letra.imagem;
    label.text = letra.palavra;
    label1.text = [[letra.palavra substringToIndex:1] uppercaseString];
    label1.textColor = [UIColor redColor];
    [cell addSubview:image];
    [cell addSubview:label];
    [cell addSubview:label1];
    cell.detailTextLabel.text = [letra.palavra substringToIndex:1];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
