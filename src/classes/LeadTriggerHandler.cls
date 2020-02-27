/**
 * Created by Master on 27.02.2020.
 */

public with sharing class LeadTriggerHandler {
    public static void handleLeads(List<Lead> leads) {
        LeadStatus convertStatus = [
                SELECT Id, MasterLabel
                FROM LeadStatus
                WHERE IsConverted = true
                LIMIT 1
        ];
        List<Database.LeadConvert> converts = new List<Database.LeadConvert>();
        for (Lead record : leads) {
            Database.LeadConvert convert = new Database.LeadConvert();
            convert.setLeadId(record.Id);
            convert.setConvertedStatus(convertStatus.MasterLabel);
            converts.add(convert);
        }
        Database.convertLead(converts);
    }

}