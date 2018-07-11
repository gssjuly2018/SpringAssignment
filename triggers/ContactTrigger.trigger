trigger ContactTrigger on Contact (after insert,after delete,after undelete) {

    ContactTriggerHelper cth = new ContactTriggerHelper();
    
   	if(trigger.isafter && trigger.isdelete){
        cth.updateContactCountonAcc(trigger.old);
    }
    else{
        cth.updateContactCountonAcc(trigger.new);
    }
    
    
}