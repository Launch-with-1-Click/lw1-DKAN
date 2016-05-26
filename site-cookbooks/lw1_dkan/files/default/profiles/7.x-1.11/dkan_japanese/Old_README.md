# Profile ANNAI DKAN

This profile inherits from DKAN and it add some settings for a more Japanese
experience.

## Installation

### AMIAGE DKAN

This is meant to be placed within the AMIAGE DKAN Ec2 on the same directory
where DKAN can be found. Which is /usr/local/src/. Git clone, don't forget
the submodules
```
git clone
cd dkan_japanese
git submodule init
git submodule update
```
Once made this, execute this.

```
drush make --prepare-install build-dkan_japanese.make /var/www/html
```

This will get the Drupal with the parent profile, this profile and all the required Drupal
with patches et all.

### Settings for user

**Edit the example json files that you can find on the installed Drupal (/var/www/html in this example).
dbparams.json and cofigure.json**.

You can change the content. Dbparams has the parameters for the Database. the profile
has already a default, but will be overwritten by the contents of this json, as
long as the content is correct (only change the values between "").

The configure.json has the values for the configure site step. the ones where you
specify which is the site name and the admin account name/password.
