/**
 * Created by Master on 25.02.2020.
 */

trigger QuoteTrigger on Quote (after insert) {

    if (Trigger.isInsert) {
        if (Trigger.isAfter) {
            QuoteTriggerHandler.handleQuotes(Trigger.new);
        }
    }
}