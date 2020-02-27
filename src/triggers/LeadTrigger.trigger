/**
 * Created by Master on 20.02.2020.
 */

trigger LeadTrigger on Lead (after insert) {
    if (Trigger.isInsert) {
        if (Trigger.isAfter) {
            LeadTriggerHandler.handleLeads(Trigger.new);
        }
    }
}