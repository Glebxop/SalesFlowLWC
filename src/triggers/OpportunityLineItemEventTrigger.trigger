/**
 * Created by Master on 28.02.2020.
 */

trigger OpportunityLineItemEventTrigger on OpportunityLineItemEvent__e (after insert) {
    if (Trigger.isInsert){
        if (Trigger.isAfter){
            System.debug('Trigger new: '+Trigger.new);
            OpportunityLineItemEventTriggerHandler.handleEvent(Trigger.new);
        }
    }

}