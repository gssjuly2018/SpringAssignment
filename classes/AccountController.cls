public class AccountController {

      @AuraEnabled
      public static List <Account> getRecentAccounts() {
        return [SELECT Id, name,CreatedDate FROM Account ORDER BY createdDate DESC LIMIT 10];
      }
    
    
}