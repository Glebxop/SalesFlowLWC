/**
 * Created by Master on 26.02.2020.
 */

public with sharing class OpportunitiesTriggerHandler {

    public static void handleOpportunities(List<Opportunity> opportunities) {
        List<Quote> quotes = new List<Quote>();
        List<Id> oppIds = new List<Id>();
        String oppIdsString = '';
        for (Opportunity opportunity : opportunities) {
            quotes.add(new Quote(
                    OpportunityId = opportunity.Id,
                    Name = opportunity.Name)
            );
            oppIdsString += opportunity.Id+';';
            oppIds.add(opportunity.Id);
        }
        OpportunityLineItemEvent__e opportunityLineItemEvent = new OpportunityLineItemEvent__e(OppIds__c = oppIdsString);
        EventBus.publish(opportunityLineItemEvent);
        insert quotes;
    }

}