/**
 * Created by Master on 25.02.2020.
 */

trigger QuoteTrigger on Quote (after insert) {

    if (Trigger.isInsert) {
        if (Trigger.isAfter) {

            Map<Id, Id> quoteIds = new Map<Id, Id>();
            for (Quote quote : Trigger.new) {
                quoteIds.put(quote.Id, quote.OpportunityId);
            }
            QuoteTriggerHandler.syncQuote(quoteIds);
        }
    }
}