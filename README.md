# README

User model has email, name, number properties as well as important properties @event_status @event_time, and @claim_status. These determine first wether the user has started a claim in the show view. Claims are when the user has a tech issue and presses the big button in the view.

When @event_status is turned from false to true @event_time is created. The third property, @claim_status, we will hold off on until I explain the other model.

The other model is called Wizard. This is the employee database which holds name, email and its most relevant data type, @working_magic.
The employee dashboard is the view, dash.html.erb. When an employee or 'Wizard' logs in they see the 5 most recent claims (using @event_time). The oldest claim appears emphasized and gives the Wizard the option to claim the event. Upon pressing the button the user's @claim_status changes to true and the option to claim that user becomes unavailable to other Wizards.

The user who's ticket was claimed now has their number revealed to the button clicking Wizard, allowing that employee to call the user and troubleshoot. The Wizard's @working_magic status in the model is then changed from false to true, preventing them from claiming another ticket on the dashboard, since they are then troubleshooting.

The site is currently on Heroku - https://wizard-magic-app.herokuapp.com
