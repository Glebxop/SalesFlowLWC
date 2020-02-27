/**
 * Created by Master on 26.02.2020.
 */

public with sharing class OpportunitiesTriggerHandler {

    public static void handleOpportunities(List<Opportunity> opportunities) {


        List<Quote> quotes = new List<Quote>();
        List<Id> oppIds = new List<Id>();
        for (Opportunity opportunity : opportunities) {
            quotes.add(new Quote(OpportunityId = opportunity.Id, Name = opportunity.Name));
            oppIds.add(opportunity.Id);
        }
        handleLineItems(oppIds);
        insert quotes;
    }

    @Future
    private static void handleLineItems(List<Id> oppIds) {
        List<Pricebook2> pricebook2s = [SELECT Id,Name, (SELECT Id, UnitPrice, Product2.Name FROM PricebookEntries) FROM Pricebook2 WHERE Name = 'For everyone'];

        List<OpportunityLineItem> lineItems = new List<OpportunityLineItem>();
        for (Id id : oppIds) {
            lineItems.add(new OpportunityLineItem(PricebookEntryId = pricebook2s.get(0).PricebookEntries.get(0).Id, OpportunityId = id,
                    UnitPrice = pricebook2s.get(0).PricebookEntries.get(0).UnitPrice, Quantity = 1));
        }
        insert lineItems;
    }

}