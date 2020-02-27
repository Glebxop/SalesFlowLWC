/**
 * Created by Master on 20.02.2020.
 */

trigger LeadTrigger on Lead (after insert) {
    if (Trigger.isInsert) {
        if (Trigger.isAfter) {
            LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted = true LIMIT 1];
            //Database.LeadConvert[] converts = new Database.LeadConvert[0];
            List<Database.LeadConvert> converts = new List<Database.LeadConvert>();
            for (Lead record : Trigger.new) {
                System.debug(record);
                Database.LeadConvert convert = new Database.LeadConvert();
                convert.setLeadId(record.Id);
                convert.setConvertedStatus(convertStatus.MasterLabel);
                converts.add(convert);
            }
            List<Database.LeadConvertResult> lcr = Database.convertLead(converts);
            System.debug(lcr);
        }
    }

}