# Changelog

[Learn more about git-chglog](https://github.com/git-chglog/git-chglog)

## Generating changelog


Install changelog tool:

```bash
asdf plugin add git-chglog
asdf install git-chglog latest
asdf local git-chglog <LATEST_VERSION>
```

For the first time when repo does not have changelog:

```bash
git-chglog --init
# then walk through the wizard (options can be changed later in a file)
```

Every release, generate changelog:

```bash
# if you don't have any tags yet, you can generate changelog for the first time with:
git-chglog -o CHANGELOG.md --next-tag vMAJOR.MINOR.PATCH
# if you already have tags, you can generate changelog with:
git-chglog -o CHANGELOG.md
```