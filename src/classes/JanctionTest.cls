/**
 * Created by Master on 26.02.2020.
 */

public with sharing class JanctionTest {
    public static void testJ(){

        List<Pricebook2> pricebook2s = [SELECT Id,Name, (SELECT Id, UnitPrice, Product2.Name FROM PricebookEntries) FROM Pricebook2 WHERE Name = 'For everyone'];

        for (Pricebook2 pricebook2 : pricebook2s){
            System.debug('PriceBookName'+pricebook2.Name);
            for (PricebookEntry pricebookEntry : pricebook2.PricebookEntries){
            System.debug('PriceBookEntryPrice'+ pricebookEntry.UnitPrice);
            System.debug('PriceBookEntryProductName'+ pricebookEntry.Product2.Name);
            }
        }

        Opportunity opportunity = [SELECT Id FROM Opportunity WHERE Name='Testtt' LIMIT 1];
        //opportunity.Pricebook2Id=pricebook2s.get(0).Id;
        OpportunityLineItem lineItem =new OpportunityLineItem(PricebookEntryId=pricebook2s.get(0).PricebookEntries.get(0).Id, OpportunityId=opportunity.Id,
        UnitPrice=pricebook2s.get(0).PricebookEntries.get(0).UnitPrice, Quantity=1);
       // update opportunity;
        insert lineItem;
        System.debug(opportunity);

        /*
        List<PricebookEntry> pricebookEntries = [SELECT Id, Name,Product2.Name,Pricebook2.Name, UnitPrice FROM PricebookEntry];
        for (Integer i = 0; i <pricebookEntries.size() ; i++) {

            System.debug([SELECT Name FROM Pricebook2 WHERE Id=:pricebookEntries.get(i).Pricebook2.Id]);
            System.debug(
                    [SELECT Id,Name FROM Product2 WHERE Id=:pricebookEntries.get(i).Product2.Id]+' PR '+
                            pricebookEntries.get(i).UnitPrice
            );
        }*/

    }

}