/**
 * Created by Master on 27.02.2020.
 */
@IsTest
public with sharing class OpportunitiesTriggerHandlerTest {

    @TestSetup
    static void prepareDate(){
        Product2 product2 = new Product2(
                Name = 'Phone',
                IsActive = true
        );
        insert product2;
        Pricebook2 pricebook2 = new Pricebook2(
                Name = 'For everyone',
                IsActive = true
        );
        insert pricebook2;
        Pricebook2 standardPricebook = new Pricebook2(
                Id = Test.getStandardPricebookId(),
                IsActive = true
        );
        update standardPricebook;
        PricebookEntry pricebookEntryStandart = new PricebookEntry(
                Pricebook2Id = standardPricebook.Id,
                Product2Id = product2.Id,
                IsActive = true,
                UnitPrice = 1000
        );
        insert pricebookEntryStandart;
        PricebookEntry pricebookEntry = new PricebookEntry(
                Pricebook2Id = pricebook2.Id,
                Product2Id = product2.Id,
                IsActive = true,
                UnitPrice = 1000
        );
        insert pricebookEntry;

    }

    @IsTest
    static void checkProductOpportunities(){
        Opportunity opportunity = new Opportunity(
                Name = 'NameOpp',
                CloseDate = System.today().addDays(5),
                StageName = 'Stage'
        );
        Test.startTest();
        insert opportunity;
        Test.stopTest();
        OpportunityLineItem opportunityLineItem = [
                SELECT Id, OpportunityId
                FROM OpportunityLineItem
                WHERE OpportunityId =: opportunity.Id
                LIMIT 1
        ];
        System.assertEquals(opportunity.Id, opportunityLineItem.OpportunityId);
        System.assert([SELECT Id FROM Quote].size()>0);
    }

}