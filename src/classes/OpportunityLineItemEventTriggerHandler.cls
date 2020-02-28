/**
 * Created by Master on 28.02.2020.
 */

public with sharing class OpportunityLineItemEventTriggerHandler {
    private static String PRICE_BOOK_NAME = 'For everyone';
    public static void handleEvent(List<OpportunityLineItemEvent__e> events){

        /*Opportunity opportunity = new Opportunity(
                Name = 'InEventHandler',
                CloseDate = System.today().addDays(5),
                StageName = 'Stage'
        );
        insert opportunity;*/
        List<Id> oppIds = new List<Id>();
        for (OpportunityLineItemEvent__e event : events){
           // List<String> ids = event.OppIds__c.split(';');
            oppIds.addAll(event.OppIds__c.split(';'));
            //oppIds.addAll(ids);
            System.debug('HandlerEvt '+event.OppIds__c);
        }

        List<Pricebook2> pricebook2s = [
                SELECT Id,Name,
                (SELECT Id, UnitPrice, Product2.Name FROM PricebookEntries)
                FROM Pricebook2
                WHERE Name =: PRICE_BOOK_NAME
        ];
        List<OpportunityLineItem> lineItems = new List<OpportunityLineItem>();
        for (Id id : oppIds) {System.debug(id);
            lineItems.add(new OpportunityLineItem(
                    PricebookEntryId = pricebook2s.get(0).PricebookEntries.get(0).Id,
                    OpportunityId = id,
                    UnitPrice = pricebook2s.get(0).PricebookEntries.get(0).UnitPrice,
                    Quantity = 1)
            );
        }System.debug(lineItems);
        insert lineItems;
        System.debug(lineItems);
        System.debug([SELECT Id FROM OpportunityLineItem]);

    }
}