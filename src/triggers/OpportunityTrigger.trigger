/**
 * Created by Master on 25.02.2020.
 */

trigger OpportunityTrigger on Opportunity (after insert) {
    if (Trigger.isInsert) {
        if (Trigger.isAfter) {
            OpportunitiesTriggerHandler.handleOpportunities(Trigger.new);
        }
    }
}