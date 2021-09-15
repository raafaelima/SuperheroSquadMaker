# SuperheroSquadMaker

## About the APP
The app is architected using the principles of SOLID and PACT. MVC was used as design pattern to view separation.
I believe that this is sufficient to get a clear understanding of the code and how to navigate through it. Also, the app is written in Swift 5

In the app you will find the following structure:
* SuperheroSquadMaker - All the app code is in there
* SuperheroSquadMakerTests - All the Unit Tests
* SuperheroSquadMakerUITests - All The UiTests

I'm using Fastlane to automate the tests and lint executions.
I use Carthage as a dependency manager and the following libraries are used to support:

Database
* Realm

ImageManagement
* Kingfisher

## Getting Started
1. Mac OS X Sierra 11.5.2 or higher
2. Xcode 12.5 or higher
3. Install [HomeBrew](http://brew.sh/)
4. Setup up the environment (be sure to fill the vars)
>
>```bash
># Needed for fastlane
>export LC_ALL=en_US.UTF-8
>export LANG=en_US.UTF-8
>```

4. make setup *
>
>```bash
>make setup
>```

  This will install the following tools (if not present)
  >
  >0. brew packages - python3, rbenv, carthage, python, git, swiftlint, imagemagick
  >0. ruby 2.3.1, bundler, gems referred in the Gemfile.lock
  >0. pip, xUnique


## Running

1. Run the tests

>
>```bash
>make test
>```

4. List all targets with documentation
>
>```bash
>make
>```

## Improvement Points

- Infinite scroll at the heroes list
- Add UI tests to validate the flows of add/remove hero to the squad
- UX and error messages
- i18n the strings.

## References
[PACT](https://www.thoughtworks.com/pt/insights/blog/write-quality-mobile-apps-any-architecture)
