trigger SubscriptionTrigger on Subscription__c (after insert, after update) {
    for (Subscription__c sub : Trigger.new) {
        if (sub.Status__c == 'Active') {
            // Example logic for active subscriptions
            System.debug('Subscription is active: ' + sub.Name);
            // Implement additional logic like sending notifications or updating related records
        }
    }
}
