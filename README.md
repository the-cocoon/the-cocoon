### The Cocoon

The Cocoon for my reusable Rails modules and libs

Add the cocoon to a project

```sh
git submodule add -b master git@github.com:the-cocoon/the-cocoon.git the-cocoon
```

Init and update submodule `the-cocoon`

```sh
git submodule init
git submodule update
```

init and update all submodules in `the-cocoon`

```sh
cd the-cocoon

git submodule init
git submodule update
```

If a one of gubmodules is updated then `the-cocoon` ask you about update the `the-cocoon`

And right after that the project will ask the same

That is how cascade like control will be provided
