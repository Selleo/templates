# Changelog

[Learn more about git-chglog](https://github.com/git-chglog/git-chglog)

## Generating changelog

### Without makefile

Every release, generate changelog:

```bash
# if you don't have any tags yet, you can generate changelog for the first time with:
git-chglog -o CHANGELOG.md --next-tag vMAJOR.MINOR.PATCH
# if you already have tags, you can generate changelog with:
git-chglog -o CHANGELOG.md
```

Example:

```bash
git tag -m "Release new version" -a vX.Y.Z
git-chglog -o CHANGELOG.md
git add CHANGELOG.md
git commit -m "docs: Update CHANGELOG.md"
git push origin HEAD --tags
```

### With makefile

```bash
TAG=vX.Y.Z make changelog
```

## Install changelog tool

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
