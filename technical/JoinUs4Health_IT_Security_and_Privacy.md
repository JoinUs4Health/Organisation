# JoinUs4Health IT Security and Privacy

| Version    | Editor  | Comments             |
| ---------- | ------- | -------------------- |
| 16.02.2021 | winterb | created base version | 

**Who should read this document?**

- everyone working in the project JoinUs4Health, who is…
    - working with personal data (Name, Address, E-Mail, IP, Photos,…)
    - wants to suggest new features/ideas for communication and data transfer
    - …actually everyone in the project!

**What purposes has this document?**

- main purpose to address the privacy- and it-security view on aspects in our project
- explain privacy and technical related topics and problems
    - so that we all can talk about it
    - so that we are able to make good decisions
- give instructions on how (not) to do things
    - as a central reference book

**What is the structure of this document?**

- there are three major parts
    - explanations (simple and short) - terms, examples, explainations,…
    - Security Requirements - basic it-security requirements for working together and providing services
    - topics - concrete questions, how-to's,…
- the goals are
- if you want to contribute to this document: you are welcome! Please just make sure to…
    - minimise prose text, better use bullet points
    - keep it simple and easy to read
    - keep is understandable for everyone
    - use meaningful headlines
        - feel free to spoiler the conclusion!
        - idea: the table of content in this document should work as a fast reference

**Table of Content**

<!-- TOC START min:1 max:10 link:true asterisk:false update:true -->
- [JoinUs4Health IT Security and Privacy](#joinus4health-it-security-and-privacy)
- [Explanations](#explanations)
    - [IP address, or in short IP](#ip-address-or-in-short-ip)
    - [HTTP Referrer, also HTTP referer](#http-referrer-also-http-referer)
    - [Browser Fingerprint](#browser-fingerprint)
    - [Cookies](#cookies)
- [Security Requirements for JoinUs4Health](#security-requirements-for-joinus4health)
    - [technical](#technical)
    - [operational](#operational)
- [Guidelines](#guidelines)
    - [Building any kind of own web presence (website, platform)](#building-any-kind-of-own-web-presence-website-platform)
        - [Third-party content on our website](#third-party-content-on-our-website)
            - [Load CSS, Scripts, Images, Fonts from our own server](#load-css-scripts-images-fonts-from-our-own-server)
            - [Don't load third-party content without consent.](#dont-load-third-party-content-without-consent)
                - [Use social media buttons in privacy mode](#use-social-media-buttons-in-privacy-mode)
                - [Embed Maps, Videos, Images and other media provided by third parties with a placeholder](#embed-maps-videos-images-and-other-media-provided-by-third-parties-with-a-placeholder)
            - [Check all Plugins for third-party requests](#check-all-plugins-for-third-party-requests)
        - [Users must be at least 16 years old to register](#users-must-be-at-least-16-years-old-to-register)
        - [Analyse your users behaviour GDPR compliant and only on your server](#analyse-your-users-behaviour-gdpr-compliant-and-only-on-your-server)
    - [Using another platform for our content (i.e. social media)](#using-another-platform-for-our-content-ie-social-media)
        - [Don't make it mandatory for participants to use your choice of social system](#dont-make-it-mandatory-for-participants-to-use-your-choice-of-social-system)
<!-- TOC END -->

# Explanations

## IP address, or in short IP
- "Internet Protocol address"
- the address of your computer or network, i.e. `141.53.123.10` or `2001:db8:0:1234:0:567:8:1`
- this address is transferred to any party you are connecting to via the internet
- has information about you
    - your country
    - your internet provider
    - your company or university
- **the IP address is personal data** by GDPR

## HTTP Referrer, also HTTP referer
- this is an optional data field in the hypertext transfer protocol, storing the Domain of the previous page
- **the referrer reveals detailed information about the user to third parties**
- example
    - Alice visits the website http://example.com/with/any/website
    - this website returns a webpage with an external link for loading an image from http://my-images.com/3674894/42.jpg
    - Alice' Browser will try to render the website and loads the image from the domain `my-images.com`
        - by loading the image, the browser will tell `my-images.com` the HTTP referrer among other things (IP address, Browser Fingerprint)
        - the referrer-information contains the original address `http://example.com/with/any/website`
    - now the owner of the domain `my-images.com` knows, who was visiting what subpage of the domain `example.com`

## Browser Fingerprint
- the browser fingerprint is a term to summarise all details provided by a browser to re-identify this specific browser
    - your operating system and version
    - your browser and version
    - the plugins your browser supports
    - … many, many more informations are used here
- [Presentation about the technical background and explanation of this topic](https://media.ccc.de/v/rc3-113142-the_elephant_in_the_background)
- it's possible to re-identify your browser (and you) even if your IP address has changed and if you deleted all cookies or if you are in a private network sharing one public IP address with others
- you can test you browser fingerprint here: https://coveryourtracks.eff.org

## Cookies
- cookies are one way to save a little information in the browser of an user
- the user can delete or change all cookies as she likes (i.e. browser option: delete all cookies, when I close my browser)
- session-cookies
    - are useful to
        - save information about the session (session id)
        - save information about the products in your cart
    - there is no problem with the GDPR with session cookies, and no cookie banner is needed
- permanent-cookies
    - are useful to
        - uniquely identify the user (this is the "remember me" option on some login sites)
        - track the user over more then one website
    - **for using permanent-cookies you need a cookie banner**
    - **for using permanent-cookies you need to inform the user in the privacy statement about everything**
    - **using permanent-cookies from third-parties makes it even more difficult**

# Security Requirements for JoinUs4Health
## technical
- channels used for transferring data transfer should be encrypted
- channels used for transferring personal data or credentials must be end-to-end encrypted with current standards (PGP/GPG, TLS 1.2+, VeraCrypt,…)
- encryption methods and Ciphers must comply with current standard
- automatic updates for all kinds of software must be configured

## operational
- passwords need to comply with the current standards
    - the longer the better
    - use random characters or random words to generate a secure password
- group password must be stored in a password manager (i.e. KeePassXC)
    - access to the password manager file and content must be minimised
- personal password, related to your work in this project, should be stored in a password manager (i.e. KeePassXC)
- the count of people with potential access to personal data must be minimised

# Guidelines

## Building any kind of own web presence (website, platform)

### Third-party content on our website
- first rule: *avoid third party content whenever possible!*
- if we use third-party content, we need to document every single item in the privacy statement
- it's much easier to use services from the EU than from the United States of America
- see Art. 6 GDPR

#### Load CSS, Scripts, Images, Fonts from our own server
- loading the current version of library XY directly from the provider is easy and can be a 'legitimate interest' (Art. 6 GDPR)
    - but we need to write down every single case in our privacy statement with
        - a reason
        - the other company and a
        - link to their *GDPR-compliant* privacy statement

#### Don't load third-party content without consent.
- I know, the headline is not 100% right, but it's about to get the reader think about what we really want to do and what is necessary.

##### Use social media buttons in privacy mode
- either use simple links to the social media platform
- [or use a plugin like Shariff](https://github.com/heiseonline/shariff) to avoid loading content before you have the consent

##### Embed Maps, Videos, Images and other media provided by third parties with a placeholder
- use a placeholder with an info text:
    - "Clicking on this image will result in loading a video/image/… from example.com. All content, functions and cookies are subject to the external partner. You can find the privacy policy of the partner here. For more information read our privacy policy here." …or something like that
    - after the click, the placeholder gets replaced by the content
- it's possible to have exceptions here, i.e.
    - we need an interactive map like OSM on a page to show something, have an own layer providing more data
    - we have third party content behind the login and the user agreed to our terms and privacy policy

#### Check all Plugins for third-party requests
- i.e. SPAM-detection in Comment-Plugins sometimes works with third parties

### Users must be at least 16 years old to register
- This applies to all three participating countries (we double checked)

### Analyse your users behaviour GDPR compliant and only on your server
- don't use Google Analytics or any third-party system
- have a look at https://matomo.org

## Using another platform for our content (i.e. social media)

### Don't make it mandatory for participants to use your choice of social system
- otherwise it's a way to exclude people

