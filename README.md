<h1>Confirm Before Save In Interactive Grid - Oracle APEX Dynamic Action Plugin</h1>

Plug-in for showing a confirm message before saving an Interactive Grid, based on the DML event chosen by the user.

<h2>Installation</h2>
Import plugin file "dynamic_action_plugin_ig_confirm_before_save.sql" from Source directory into your application.

<h2>How to Use</h2>
  1) Provide a Static ID to the Interactive Grid for which you want to use this plugin.<br>
  2) Create a Dynamic Action (Event: Page Load).<br>
  3) Create a True action.<br>
  4) Select the <b>Interactive Grid - Confirm Before Save [Plug-in]</b> option.<br>
  5) Provide the Static ID of the Interactive Grid in the <b>Region Static ID</b> field.<br>
  6) Choose the Event for which you want to show the Confirm Message (eg: Insert, Update, Delete, Insert/Update etc...).<br> 
  7) There is a default Confirm message that will be populated. If Required, the Confirm Message can be customized.

<h2>Images For Reference</h2>
<b>IG Static ID:</b><br>
   https://user-images.githubusercontent.com/30211230/172178216-59e1f8c0-9c68-4399-a9e3-3bb4938a1973.png<br>
<b>Plugin Attributes:</b><br>
   https://user-images.githubusercontent.com/30211230/172179275-5278e21e-e8e7-4dc9-b62e-8de434c81050.png<br>
   Description for the numbering from the above image:<br>
   &emsp;1) Static ID of the Interactive Grid for which you want to use this plugin.<br>
   &emsp;2) DML Event for which the confirm message must be shown.<br>
   &emsp;3) Confirm message that will be shown to the user.
    
<h2>Demo</h2>
https://apex.oracle.com/pls/apex/workspace_akil/r/demo/ig-confirm-before-save

