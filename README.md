# AppleScripts for OmniFocus 2

A curated collection of applescripts that I have made and/or commandeered for OmniFocus 2.

# Installation

Fork the repository and do like so:

```
git clone https://github.com/chauncey-garrett/applescript-omnifocus.git "$HOME/Library/Application Scripts/com.omnigroup.OmniFocus2"
```

If you plan on contributing back to the repository, add the following to `.git/config`. This code will ensure that the AppleScripts are viewable under version control by decompiling them to plain text before updating the repository.

```
[filter "ascr"]
	clean = "$(git rev-parse --show-toplevel)"/git-ascr-filter.sh --clean %f
	smudge = "$(git rev-parse --show-toplevel)"/git-ascr-filter.sh --smudge %f"
```


## Like it?

If you have feature suggestions, please open an [issue](https://github.com/chauncey-garrett/applescript-sonos/issues "chauncey-garrett/applescript-sonos/issues"). If you have contributions, open a [pull request](https://github.com/chauncey-garrett/applescript-sonos/pull-request "chauncey-garrett/applescript-sonos/pulls"). I'd love to expand this library as much as is possible.

## Author(s)

Note that there are some scripts here that I did NOT make and have only curated within this repository. If you found a particular script useful that I did not author, please send your support to that particular person. To the best of my ability, appropriate licensing and authorship information is provided for those scripts which I have not written.

*The author(s) of this module should be contacted via the [issue tracker](https://github.com/chauncey-garrett/applescript-sonos/issues "chauncey-garrett/applescript-sonos/issues").*

  - [Chauncey Garrett](https://github.com/chauncey-garrett "chauncey-garrett")

[![](/img/tip.gif)](http://chauncey.io/about/index.html#tip)
