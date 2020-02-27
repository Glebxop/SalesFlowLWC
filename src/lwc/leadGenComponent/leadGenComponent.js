/**
 * Created by Master on 19.02.2020.
 1). Create custom lwc form for lead creation and publish that to community
 2). Community will need to be with auth(create community users for that)
 3). After lead automatically convert it to account, contact and opportunity
 4). After that go ahead and automatically create all relaited objects in sales flow
 5). Final step of the flow will be a publishing about contact creation on chatter group(create mannually) and notification in feed item
 */

import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import COMPANY_FIELD from '@salesforce/schema/Lead.Company';
import NAME_FIELD from '@salesforce/schema/Lead.Name';
import LEAD_OBJ from '@salesforce/schema/Lead';


export default class LeadGenComponent extends LightningElement {
     @api
    objectApiName = LEAD_OBJ.objectApiName;
    fields = [NAME_FIELD, COMPANY_FIELD];

    handleSuccess(event) {
       const evt = new ShowToastEvent({
                title: "Lead created",
                message: "Record ID: " + event.detail.id,
                variant: "success"
            });
            this.dispatchEvent(evt);
    }
}