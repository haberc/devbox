# Contributing

Contributionns to this project are welcome. The devbox setup can sure use more
provisioning scripts to have more services ready-to-use.

Also, reporting any issues, bugs or requests for improvements as well as better documentation
are valuable contributions.

## Provisioners

When adding a provisioner to the devbox, please mimic the style of the existing ones.
A good example is the [CouchDB provisioner](https://github.com/lnwdr/devbox/blob/master/provisioners/shell/couchdb.sh).

Remember that a provisioner for a service that speaks HTTP should also generate an Nginx conf file
for a reverse proxy to that service. Again, see the CouchDB example for reference.

When a provisioner generates a file (binaries, symlinks, confs) it should first check, if that file exists.
Provisioning steps should only be executed when necessary. Wrap things in conditions accordingly.

Ideally, after successfully executing a provisioner once, a second run should do nothing at all.

When making changes to existing files, make sure that it's safe to execute the provisoner mutliple times without changing the results.

## Packages

When installing packages during provisioning, binary packages should be preferred.

Using FreeBSD's ports system is ok when necessary, though. Just use it sparingly since the compilation
makes provisioning very slow.

# Contributor Code of Conduct

As contributors and maintainers of this project, and in the interest of
fostering an open and welcoming community, we pledge to respect all people who
contribute through reporting issues, posting feature requests, updating
documentation, submitting pull requests or patches, and other activities.

We are committed to making participation in this project a harassment-free
experience for everyone, regardless of level of experience, gender, gender
identity and expression, sexual orientation, disability, personal appearance,
body size, race, ethnicity, age, religion, or nationality.

Examples of unacceptable behavior by participants include:

* The use of sexualized language or imagery
* Personal attacks
* Trolling or insulting/derogatory comments
* Public or private harassment
* Publishing other's private information, such as physical or electronic
  addresses, without explicit permission
* Other unethical or unprofessional conduct

Project maintainers have the right and responsibility to remove, edit, or
reject comments, commits, code, wiki edits, issues, and other contributions
that are not aligned to this Code of Conduct, or to ban temporarily or
permanently any contributor for other behaviors that they deem inappropriate,
threatening, offensive, or harmful.

By adopting this Code of Conduct, project maintainers commit themselves to
fairly and consistently applying these principles to every aspect of managing
this project. Project maintainers who do not follow or enforce the Code of
Conduct may be permanently removed from the project team.

This Code of Conduct applies both within project spaces and in public spaces
when an individual is representing the project or its community.

Instances of abusive, harassing, or otherwise unacceptable behavior may be
reported by contacting a project maintainer at <leon@lnwdr.de>. All
complaints will be reviewed and investigated and will result in a response that
is deemed necessary and appropriate to the circumstances. Maintainers are
obligated to maintain confidentiality with regard to the reporter of an
incident.


This Code of Conduct is adapted from the [Contributor Covenant][homepage],
version 1.3.0, available at
[http://contributor-covenant.org/version/1/3/0/][version]

[homepage]: http://contributor-covenant.org
[version]: http://contributor-covenant.org/version/1/3/0/
