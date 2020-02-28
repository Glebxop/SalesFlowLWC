/**
 * Created by Master on 28.02.2020.
 */

trigger OpportunityLineItemEventTrigger on OpportunityLineItemEvent__e (after insert) {
    if (Trigger.isInsert){
        if (Trigger.isAfter){
            OpportunityLineItemEventTriggerHandler.handleEvent(Trigger.new);
        }
    }

}