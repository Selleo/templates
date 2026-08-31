# Push to another repository

## The problem
Sometimes we need push code from `Repository A` 
action to `Repository B` codebase, for eg. when we are implementing
GitOps(for the deployment repo) or when we need separate repo for build
process for eg. with Design Tokens.

## Solution
We can leverage GitHub deploy keys(https://docs.github.com/en/developers/overview/managing-deploy-keys), heres how:
1) Follow the steps in the official guide.
2) In step 4 add key to our destination(`Repository B`) repo.
3) In step 7 check `Allow write access`.
4) Go to source repo(`Repository A`).
5) Go to `Settings` > `Secrets` > `Actions`.
6) Click `New repository secret`.
7) Add name for eg. `DEPLOY_SSH_KEY` - remember it must match variable name used in workflow.
8) As content paste your private key `.pem`.
9) Add push step form `push-to-another-repo.yml` file to your workflow.
