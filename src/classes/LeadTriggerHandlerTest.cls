/**
 * Created by Master on 28.02.2020.
 */
@IsTest
public with sharing class LeadTriggerHandlerTest {
    @IsTest
    static void handleLeadTest(){
        Lead lead = new Lead(
                LastName = 'LeadTest',
                Company = 'CompanyTest'
        );
        Test.startTest();
        insert lead;
        Test.stopTest();
        Account account = [
                SELECT Id, Name
                FROM Account
                LIMIT 1
        ];
        Contact contact = [
                SELECT Id, Name
                FROM Contact
                LIMIT 1
        ];
        Opportunity opportunity = [
                SELECT Id, Name
                FROM Opportunity
                LIMIT 1
        ];
System.assertEquals(account.Name, lead.Company);
System.assertEquals(contact.Name, lead.LastName);
System.assertEquals(opportunity.Name, lead.Company);

    }

}