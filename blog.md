---
layout: default
title: Blog
---

Blog
========================================

<p>Blog RSS here: <a title="blog RSS" href="http://easterneurope.github.io/feed.xml">
                    <i class="fa fa-rss-square"></i></a></p>

<div id="home">
  <h2>Posts</h2>
  <ul class="posts">
    {% for post in site.posts %}
      <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>
</div>

<div style="margin: 15px 0; padding-top: 5px;">
<small>
    <a href="/archive.html" title="an archive of all posts">&larr; More posts</a>
</small>
</div>
