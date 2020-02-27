/**
 * Created by Master on 26.02.2020.
 */

public with sharing class QuoteTriggerHandler {

    public static void handleQuotes(List<Quote> quotes) {
        Map<Id, Id> quoteIds = new Map<Id, Id>();
        for (Quote quote : quotes) {
            quoteIds.put(quote.Id, quote.OpportunityId);
        }
        QuoteTriggerHandler.syncQuote(quoteIds);
    }

    @Future
    private static void syncQuote(Map<Id, Id> quoteIds) {
        List<Opportunity> opportunities = new List<Opportunity>();
        for (Id idCurrent : quoteIds.keySet()) {
            opportunities.add(new Opportunity(
                    Id = quoteIds.get(idCurrent),
                    SyncedQuoteId = idCurrent)
            );
        }
        update opportunities;
    }
}