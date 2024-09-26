public with sharing class AccountTriggerHandler {
    public AccountTriggerHandler() {

    }

    public void onBeforeInsert(List<Account> newAccounts){
        for (Account acc : newAccounts) {
            acc.Phone = '444444';            
        }        
    }

    public void onAfterInsert(List<Account> newAccounts){
        Set<Id> accIds = new Set<Id>();
        List<Contact> contactList = new List<Contact>();
        Integer i =0;
        for (Account acc : newAccounts) {
            Contact cn = new Contact();
            cn.LastName = 'Pawar'+i;
            cn.AccountId = acc.Id;
            contactList.add(cn);
            i++;    
        }  
        
        Insert contactList;
    }
}