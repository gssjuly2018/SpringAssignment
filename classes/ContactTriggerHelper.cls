public class ContactTriggerHelper {
    
    
    public void updateContactCountonAcc(List<Contact> contacts){
        
        Set<String> s_accountIds = new Set<String>();
        Map<String,Integer> m_accountContactCountMap = new Map<String,Integer>();
        for(Contact c : contacts){
            s_accountIds.add(c.AccountId);         
        }
        
        List<Contact> l_contacts = new List<Contact>();
        l_contacts = [Select Id,AccountId from Contact where AccountId in :s_accountIds];
        
        List<Account> l_accountToUpdate = new List<Account>();
        l_accountToUpdate = [Select Id,Number_Of_Contacts__c from Account where Id in :s_accountIds];
        
        for(Account acc : l_accountToUpdate){
            Set<String> s_contactId = new Set<String>();
            for (Contact con : l_contacts) {
                if (con.AccountId == acc.Id)
                    s_contactId.add(con.Id);
            }
            acc.Number_of_Contacts__c = s_contactId.size();
        }
        
        update l_accountToUpdate;
    }
    
}