---
layout: default
title: "Git"
author: "Markus Kainu"
date: "24.08.2014"
---



# Git

## Pro Git
- [Suomeksi v1](https://git-scm.com/book/fi/v1)
- [Englanniksi v2](https://git-scm.com/book/en/v2)


```r
git init
git add .
git commit -am "message here"

# branchit
git branch xyz # uusi branchi, jossa nykyisen branchin sisalto
git checkout xyz # vaihda branchiin
git branch -D xyz # poist branchi

# orphan branch - tyhja haara
git checkout --orphan gh-pages
git rm -rf . # tuhoa kaikki ennen committausta
# lisää haluamasi tiedostot (jekyll saitti esim.)
git add .
git commit -am "uus gh-pages haara"
git push origin gh-pages
```



Pushaa masteri sekä maste että gh-pages brancheihin


```r
[core]
  repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
[remote "origin"]
	url = git@github.com:muuankarski/luntti.git
	fetch = +refs/heads/*:refs/remotes/origin/*
	push = +refs/heads/master:refs/heads/gh-pages 
	push = +refs/heads/master:refs/heads/master 
[branch "master"]
	remote = origin
	merge = refs/heads/master
```

Vedä tietty branch ([lähde](http://stackoverflow.com/questions/1709177/git-pull-certain-branch-from-github))


```r
git pull origin other-branch
```


Resettaa .gitignore ([lähde](http://stackoverflow.com/questions/1139762/ignore-files-that-have-already-been-committed-to-a-git-repository))


```r
git rm -r --cached .

git add .

git commit -m ".gitignore toimii taas"
```


vaihda github remote toiseen ([lähde](https://help.github.com/articles/changing-a-remote-s-url/))


```r
git remote set-url origin https://github.com/USERNAME/REPOSITORY_2.git
```

