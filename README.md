Shelly | Shell Interaction Using Natural Language | v 0.1
========================================================================

Idea: Andrei Lisnic - human.sh (https://github.com/alisnic/human.sh)

========================================================================


Shelly - is an easy to use CLI tool that allows accomplishing work
via Linux terminal without necessarily knowing how things are done in
Linux or in this certain Linux distro. You can just type "shelly
install firefox" OR "shelly do I have python", etc. And when the ork is done,
Shelly will be there to entertain you. "shelly give me a hug",
"shelly i'm tired of you", "shelly I love you"

Full list of supported commands can be found [here](https://github.com/lexxxas/shelly/blob/master/src/help.txt).

**Requirements:** bash

**Restrictions:** currently works on Ubuntu 12.04 or later. Should work on its derivatives.
            Other distros TBD. (NOTE: most instructions should work, except the ones that 
            use distro-specific stuff, e.g. install/update)


**Installation:** 
```bash
curl -L https://raw.githubusercontent.com/lexxxas/shelly/master/src/install.sh | sh && . ~/.bashrc && shelly welcome message
```

**Uninstall:** For now there is no automated uninstall procedure. 
Steps to uninstall:
1. Remove all Shelly data from ~/.bashrc (it will be at the EOF)
if unsure what to delete take a look at ~/.shelly/src/bashrc-addition.sh
2. sudo rm -r ~/.shelly
3. . ~/.bashrc
