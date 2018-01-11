## Mars Rover App ##


----------


### Installation ###
Unzip 'mars_rover_app.zip'.
At the command line:

    cd mars_rover_app
    gem install bundler
    bundle install

### Testing ###
Run

    rspec

### Running the app###
Run

    ruby application.rb

Then follow the prompts at the command line.

### Directory ###
├── Gemfile  #dependencies
├── Gemfile.lock  #dependency locks
├── application.rb #entry to application
├── lib 
│   ├── controller.rb #takes input
│   ├── input_parser.rb #validates input
│   ├── plateau.rb #holds plateau input
│   └── rover.rb #moves rover and returns end position
└── spec
    ├── controller_spec.rb #tests for controller
    ├── functional
    │   └── application_spec.rb #functional test for application
    ├── input_parser_spec.rb #tests for input parser
    ├── plateau_spec.rb #test for plateau
    ├── rover_spec.rb #test for rover
    └── spec_helper.rb
### Assumptions ###

 - A plateau is divided into a grid
 - A starting position of '0 0 N' means a rover starts in the bottom left corner of a plateau and is facing North
 - The square directly North from (x, y) is (x, y+1)
 - Inputs for plateau and each rover's starting position have a space between each character
 - Inputs for each rover's instructions do not have spaces between each character
 - User will press enter after an empty input to finish input session and get results  

### Design ###

I've used Ruby for this app. I've used objects to represent the controller, input parser, plateau and rover. The objects and their structure were formed using test-driven development (TTD). The controller object takes in user input and passes this to the input parser. The input parser object raises an error for incorrect input and standardizes correct input to pass to plateau and rover. Rover object takes inputs for starting position and instructions and then moves the rover and returns its end position. Plateau object holds on to plateau input.

The app runs and returns the correct output for the supplied test input.