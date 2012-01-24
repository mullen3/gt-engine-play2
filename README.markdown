Groovy Template Engine for Play 2
=========

This project is a module to Play 2. It uses the gt-engine (https://github.com/mbknor/gt-engine) to enable the same Groovy Templates from Play 1 in Play 2.
More info about gt-engine can be found here: http://kjetland.com/blog/2011/11/playframework-new-faster-groovy-template-engine/

Due to lots of SBT-integration problems, I did not integrate gt-engine into Play 2's SBT code. This means that the groovy template files
are not compiled when SBT compiles your applications. Instead, they are compiled on the fly when used the first time.

This is working:
----------------

 * Basic template stuff
 * all tags (#extends, #include, #list, etc)
 * resolving values ($)
 * resolving messages (&)
 * Checking for errors
 * Using cache
 * Resolving addresses (@)
 * Error messges showing correct source and lineno in templates
 * Finding template files from disk
 * custom tags
 * FastTag-handling-integration
 * loading templates from modules (jars)
 * resolving template files via resources
 * system params (_encoding, all the params that are auto added by play 1)
 * Code in FastTag that was not moved from play 1 to gt-engine
 * JavaExtensions
 * Resolving absolute addresses (@@)



This is still not working (Works like a todo list):
------------

 * Improve routes-resolving in tag-args by wrapping in method to try-catch it - needs "inteligent" parsing..
 * move gtviews out of conf-folder
 * Scala support (scala uses different Form-instance)
 * render args
 * i18n.tag
 * Locale support


----------


Documentation hints:

When using GTFastTags, you must have a file called gt-fasttags.txt located on the "root" of your classpath (you can put it in the /conf-folder)
Each fasttag must have its full classname on a seperate line in this file

Must have 'uses-groovy-templates.txt'-file on root of classpath in all apps/jars that contain groovy templates.
The template source root folder should be named /gtviews and should also be on the root of the classpath, for example in the conf folder.