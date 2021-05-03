# SeeWho your Phone is reaching out to

We wonder what our phones are doing all day and all night. The lucky few super geeks know how to see this activity - and even fewer can make any sense of it. [its-middle-night-do-you-know-who-your-iphone-is-talking to? Washington Post/](https://www.washingtonpost.com/technology/2019/05/28/its-middle-night-do-you-know-who-your-iphone-is-talking/)

SeeWho is part of an effort by many people and organizations around the world to make it easier for all of us to check if something is wrong with our phones. And by "something is wrong" - we mean - someone pulling your data out or tracking you, that you don't know about and don't want. Even if it turns out you are not the target of an international corporate espionage ring, you'll definitely find hordes of advertisers and data brokers making unwanted use of the phone services you are paying for. Let's take a deeper look.

### Credits

All this software is free to you. Whenever you see such a statement, you should wonder "how can it be free?" Is my data being sold so this thing can be free? Those are some of the right questions for sure. SeeWho is a combination of multiple kinds of free open source software that many different people have added to. Everyone can also see and verify everyone else's work, which helps prevent someone turning the code malicious.

The foundational software currently in use for SeeWho is from an open source project funded originally by the National Science Foundation. It used to be called Bro (kind of a joke on Big Brother, because it is so good at monitoring network traffic) and now is re-branded as Zeek. Also in SeeWho is Suricata, funded by the Open Information Security Foundation (OISF.net). https://vue.js/ is part of the user interface. 

As will be explained in more detail at the bottom of this page, other contributors worked on making the configuration of the above software easier to install, maintain, and output reports. 

********************* FIXME BELOW we are still in the process of editing, auditing and adding features to SeeWho.

![IMG_1458](https://user-images.githubusercontent.com/655557/116790919-eb004300-aa84-11eb-94e5-707f02197710.JPG)
 
### USE CASE: Suspicious URL Detonation on Clean Device

NOTE: Do not use your own phone or device to visit suspicious URLs or to "see what happens" if you click on an attachment. Your device may be compromised and cannot be trusted thereafter.

Here we demonstrate using SeeWho with a clean phone whose only purpose is use as a test device on which to detonate suspicious attachments or visit suspicious URLs:

![citizens-phish-1](https://user-images.githubusercontent.com/655557/116878960-0a66af80-abee-11eb-892b-646a82cc9efb.png)

![citizens-phish-2](https://user-images.githubusercontent.com/655557/116878964-0b97dc80-abee-11eb-83f4-4668160a8dc2.png)


### Description

SeeWho allows you to easily capture network communications from a smartphone or any device which can be associated to a Wi-Fi access point in order to quickly analyze them. This can be used to check if any suspect or malicious communication is outgoing from a smartphone, by using heuristics or specific Indicators of Compromise (IoCs).

The idea of SeeWho emerged in a meeting about stalkerware with a [French women's shelter](https://www.centre-hubertine-auclert.fr). During this meeting we talked about how to easily detect [stalkerware](https://stopstalkerware.org/) without installing very technical apps nor doing forensic analysis on the victim's smartphone. The initial concept was to develop a tiny kiosk device based on Raspberry Pi which can be used by non-tech people to test their smartphones against malicious communications issued by stalkerware or any spyware.

Of course, SeeWho can also be used to spot any malicious communications from cybercrime to state-sponsored implants. It allows the end-user to push his own extended Indicators of Compromise via a backend in order to detect some ghosts over the wire.

<p align="center"><strong>If you need more documentation on how to install it, use it and the internals, don't hesitate to take a look at the <a href="https://github.com/KasperskyLab/SeeWho/wiki">SeeWho Wiki</a>.</strong></p>

<p align="center">If you have any question about the projet, want to contribute or just send your feedback, <br />don't hesitate to contact us at seewho[@]FIXMEcreditkasp[.]com.</p>

### Use cases

SeeWho can be used in several ways by individuals and entities:

- Over a network - SeeWho is installed on a network and can be accessed from a workstation via a browser.
- In kiosk mode - SeeWho can be used as a kiosk to allow visitors to test their own devices.
- Fully standalone - By using a powerbank, two Wi-Fi interfaces or a 4G dongle and a small touch screen [like in this video](https://twitter.com/felixaime/status/1331535790392946689), you can tap any device anywhere.

### Installation

Please check the few steps in the [Wiki's Installation Page](https://github.com/KasperskyLab/SeeWho/wiki/SeeWho-installation). 

### Meet the frontend

The frontend - which can be accessed from `http://seewho.local` is a kind of tunnel which help the user throughout the process of network capture and reporting. It allows the user to setup a Wi-Fi connection to an existing Wi-Fi network, create an ephemeral Wi-Fi network, capture the communications and show a report to the user... in less than one minute, 5 clicks and without any technical knowledge. 

![Frontend](/assets/frontend.png)

### Meet the backend

Once installed, you can connect yourself to the SeeWho backend by browsing the URL `https://seewho.local` and accepting the SSL self-signed certificate. 

![Backend](/assets/backend.png)

The backend allows you to edit the configuration of SeeWho, add extended IOCs and whitelisted elements in order to prevent false positives. Several IOCs are already provided such as few suricata rules, FreeDNS, Name servers, CIDRs known to host malicious servers and so on.

### Special thanks

**Guys who provided some IOCs**
- [Cian Heasley](https://twitter.com/nscrutables) for his android stalkerwares IOC repo, available here: https://github.com/diskurse/android-stalkerware
- [Te-k](https://twitter.com/tenacioustek) for his stalkerwares awesome IOCs repo, available here: https://github.com/Te-k/stalkerware-indicators
- [Emilien](https://twitter.com/__Emilien__) for his Stratum rules, available here: https://github.com/kwouffe/cryptonote-hunt
- [Costin Raiu](https://twitter.com/craiu) for his geo-tracker domains, available here: https://github.com/craiu/mobiletrackers/blob/master/list.txt

**Code review**
- Dan Demeter [@_xdanx](https://twitter.com/_xdanx)
- Maxime Granier
- Florian Pires [@Florian_Pires](https://twitter.com/Florian_Pires)
- Ivan Kwiatkowski [@JusticeRage](https://twitter.com/JusticeRage)

**Others**
- GReAT colleagues.
- Tatyana, Kristina, Christina and Arnaud from Kaspersky (Support and IOCs)
- Zeek and Suricata awesome maintainers.
- virtual-keyboard.js.org & loading.io guys.
- Yan Zhu for his awesome Spectre CSS lib (https://picturepan2.github.io/spectre/)
