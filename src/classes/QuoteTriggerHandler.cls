/**
 * Created by Master on 26.02.2020.
 */

public with sharing class QuoteTriggerHandler {
    @Future
    public static void syncQuote(Map<Id, Id> quoteIds) {
        List<Opportunity> opportunities = new List<Opportunity>();
        for (Id idCurrent : quoteIds.keySet()) {
            opportunities.add(new Opportunity(Id = quoteIds.get(idCurrent), SyncedQuoteId = idCurrent));
        }
        update opportunities;

    }

}