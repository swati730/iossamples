//
//  SqliteLib.h
//  database
//
//  Created by digicorp on 15/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#define kFilename @"goims.sqlite"

@interface SqliteLib : NSObject {
	
}
/*************************************************/
+(BOOL)OpenDB;
+(void)closeDB;
/*************************************************/
+(BOOL)CreateDB :(NSString *)TableName FieldsInTable:(NSDictionary *)Fieldsname;
+(NSArray*)ColoumnInTables:(NSString*)tablename;
/*************************************************/
+(BOOL)InsertRow:(NSString *)TableName ValueToInsert:(NSDictionary *)valueData;
+(void)MultipleRowInertion:(NSString *)TableName ValueToInsert:(NSArray *)values;
+(BOOL)updateRow :(NSString *)TableName updatedField:(NSDictionary *)fieldToUpdate updateFrom:(NSString*)fieldFromUpdate;
+(BOOL)DeleteRow:(NSString *)TableName ColumnNameAndValuetoDelete:(NSDictionary *)columndata;
+(BOOL)AlterTable:(NSString *)TableName ColumnNameAndDataType:(NSDictionary *)columndata Action:(NSString*)actionstr;
+(void)DropDB:(NSString *)TableName;
/*************************************************/
+(NSArray *)SelectData:(NSString *)TableName values:(NSArray *)selectValues;
+(NSMutableArray*)CustomeQuery:(NSString*)query;
+(NSArray*)SelectDistinctData:(NSString *)TableName ColoumnName:(NSString*)ColName;
+(NSArray *)SelectDataWithContdition:(NSString *)TableName values:(NSArray *)selectValues Conditions:(NSString*)Con;
+(NSArray *)SelectDataOrderBy:(NSString *)TableName ColumnName:(NSArray *)ColName isDESC:(BOOL)isDesc OrderByColName:(NSString*)Coloumn;
/*************************************************/
+(int)CountQuery:(NSString*)query;
@end
