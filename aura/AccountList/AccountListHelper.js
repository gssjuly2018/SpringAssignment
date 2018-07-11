({
      getAccountList: function(component) {
        var action = component.get('c.getRecentAccounts');
        // Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {
         component.set('v.recentaccounts', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
      }
    })