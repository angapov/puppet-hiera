  Rule server roles with Puppet and Hiera.

  The most difficult and the most vital problem - how to rule server roles with Puppet in the most efficient way. I've read many articles in Internet, they all have one common significant flaw - they discuss only one aspect of Hiera and Puppet and close eyes on another ones. So I was not able to find any suitable universal solution how to rule large infrastructures with Puppet.
  What I want?
  I want a single text file that describes my infrastructure on its high level. It must consist of roles, servers and server groups. Nothing more: no values, no settings, no nothing. Only roles, servers and server groups. I  want that text file to be then parsed by Puppet and executed on real infrastructure.

site.pp - piece of code to be included into environment manifest.
hiera.yaml - Hiera YAML file describes high-level structure of Hiera.
roles.yaml - file describing how roles apply to servers and server groups.
