Beanstalk [4.3] for SEMC 2011 devices
===============

Local manifest needed to build Beanstalk [4.3] for the Sony Ericsson 2011 phone line.

Instructions:
-------------


TO build Beanstalk for Xperia 2011 devices here is procedure

 mkdir beanstalk
 
 cd beanstalk
 
 mkdir system
 
 cd system
 
 repo init -u git://github.com/scotthartbti/android.git -b jb43
 
 mkdir -p ~/beanstalk/system/.repo/local_manifests
 
 curl https://raw.github.com/officiallysonyrebel/local_manifests/cm-10.2/semc.xml > ~/beanstalk/system/.repo/local_manifests/semc.xml
 
 repo sync
 
 curl https://raw.github.com/LegacyXperia/local_manifests/cm-10.2/updates.sh > ~/beanstalk/system/updates.sh
 
 chmod a+x updates.sh
 
 ./updates.sh
 
 cd ~/beanstalk/system/vendor/cm
 
 ./get-prebuilts
 
 cd ~/beanstalk/system
 
 . build/envsetup.sh
 
 breakfast mango
 
 brunch mango
 
 
 
 **** you can replace "mango" by changing your device codename
