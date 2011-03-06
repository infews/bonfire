<a href="http://github.com/you"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://assets2.github.com/img/71eeaab9d563c2b3c590319b398dd35683265e85?repo=&url=http%3A%2F%2Fs3.amazonaws.com%2Fgithub%2Fribbons%2Fforkme_right_gray_6d6d6d.png&path=" alt="Fork me on GitHub"></a>
# Bonfire

You're a Rubyist. You want to write a book. You want to write an _ebook_. You might have Apple Pages. Adobe
InDesign? Unlikely. Microsoft Word? Not on your life.

When it comes to text, you think in [Markdown](http://daringfireball.net/projects/markdown/), CSS and HTML. You're not afraid of the command line. But you need tools in order to publish a book. What do you do?

You light a Bonfire.

## Write in Markdown

With Bonfire your book's sections are Markdown files. You can name these files however you like and reorder them atwill in `bonfire.yml`.

At any time you can make a single-file draft html version of your book for offline editing, sharing with others, and even marking up with a red pen (just like your High School English teacher).

Writing is the hard part. 

## Publish to a Directory

Publishing, which means putting all the data together in a directory of ebook-happy HTML and XML files, is the annoying part. Bonfire takes your Markdown and builds a set of HTML, CSS, image, and XML files that work as input to ebook "compilers".

Once we have this directory - which looks a whole lot like a website - we can make an ebook. This same set of files should publishable to [Amazon's Kindle Direct Publishing platform](http://kdp.amazon.com) or to any of the ePub systems (iBooks, B&N Nook)

## Using Bonfire

### Start a project
<pre><code>
$ gem install bonfire  
$ bonfire new my_book  
$ cd my_book  
$ mate . # or pick another editor
</code></pre>
Now get writing. Did we mention that's the hard part?

### Other Commands
<pre><code>
$ bonfire draft    # make a draft as a single-file HTML document
$ bonfire toc      # make an HTML version Table of Contents 
$ bonfire build    # make a publishable multi-file HTML document set 
$ bonfire publish  # make a Kindle ebook 
</code></pre>

## Current Features

* Build a draft file for editing: all sections in a single HTML file

## Upcoming Features

The [full public backlog](https://www.pivotaltracker.com/projects/244657) lives on [Pivotal Tracker](http://www.pivotaltracker.com), but here are the highlights:

* Build a released version of the book - each section in its own file, external CSS
* Auto-generate a Table of Cotents file (HTML version)
* Auto-generate OPF and NCX files (ebook manifests & navigation)
* Generate a Kindle ebook file (requires [Kindle Gen](http://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000234621))
* Generate a front-matter page with copyright, etc., that maintains a book's version
* Generate an ePub file

## Contributor's Guide

All pull requests will be considered. But like all projects, we're opinionated. We welcome your contributions that are thoughtful and include specs.

If there's interest, we'll make an email list. In the meantime, Github Issues and direct emails are fine.

## Appendix

Distributed under the MIT License

Copyright &copy; 2011 Infews LLC
