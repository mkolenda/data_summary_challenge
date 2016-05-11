## Starting the App
Clone the repository and `cd` into the project directory.

You will need to install bundler if you haven't done so already:
```
gem install bundler
```

Then install the required gems:
```
bundle install
```

Prepare the database, which in this case is the default SQLite:
```
rake db:setup
```

Start the server, again the default WEBrick server is used:
```
rails s
```

## Using the App
Once the server is spun up, navigate your browser to `localhost:3000`.

You can upload a TSV file in the same format as the `example_input.tab`. Make sure the columns in the file are seperated by a tab character `\t` (ASCII 0x09).

The app displays both the running total revenue from all purchases currently in the database, and the gross revenue from each file when it is successfully uploaded.

## Testing
Testing is done with RSpec.

To run the tests:
```
rake
```
