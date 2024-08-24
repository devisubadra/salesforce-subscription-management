public class SubscriptionController {
    public List<Subscription__c> subscriptions { get; set; }

    public SubscriptionController() {
        subscriptions = [SELECT Id, Name, Start_Date__c, End_Date__c, Status__c, Amount__c FROM Subscription__c];
    }

    public void createSubscription(String name, Date startDate, Date endDate, String status, Decimal amount) {
        Subscription__c newSub = new Subscription__c(
            Name = name,
            Start_Date__c = startDate,
            End_Date__c = endDate,
            Status__c = status,
            Amount__c = amount
        );
        insert newSub;
    }

    public void updateSubscription(Id subscriptionId, String status) {
        Subscription__c subToUpdate = [SELECT Id, Status__c FROM Subscription__c WHERE Id = :subscriptionId];
        subToUpdate.Status__c = status;
        update subToUpdate;
    }
}
