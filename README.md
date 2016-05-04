#Davis Green's Submissions

This is Davis Green's submission to the Privia Health - Coding Challenge. Having not been able to begin the challenge immediately, I was very conscious of turning around the challenge quickly. To do so, I made use of Rails scaffolding, something I generally would not do. For that reason that are many superfluous files and code snippets. I have attempted to remove any presence of these from that actual interface of the app.

That being said, I am fairly comfortable with my submission. On the root page the user is invited to add a new import which will populate a list of all previous imports. Each import can then been viewed by its constituent line items. You'll see I did decide to break down the domain of the problem in to two models: the import and the line item. I thought this was the best way to approach the problem in any kind of scalable way. I can imagine a scenario where the user would want access to the line items as a whole, regardless of the import it was included on, but then also wanting to be able to increase apparatus of the import itself(adding a name or description perhaps -- something I intended on doing with more time).

The only tests that are present are those created by the scaffolding. I did need to edit one of them to make it pass. I realize this testing is not sufficient for a production database.

To View Submission($bash commands):

###1. Clone this Repo.

###2. Navigate Into My Solution.
  ```
  $cd data_summary_challenge/privia_solution
  ```

###3. Install Gems
  ```
  $bundle install
  ```

###4. Setup Database and Migrations
  ```
  $rake db:create db:migrate
  ```

###5. Run Rails Server
  ```
  $rails s
  ```

###6. Visit http://localhost:3000/ in your local browser.

###7. Click on "Choose File" select your the tab delimited "example_input.tab" file located in this repo (I noticed something inconsistent in the original).

###8. Click Import File.

You should now notice the beginning of a list of imports, including some additional functionality to view and edit the included line items.
