**Changelog**

| date       | editor  | changes                  |
| ---------- | ------- | ------------------------ |
| 02.06.2022 | winterb | added basic requirements |

# Requirements for Content-Editors in the Project JoinUs4Health
These requirements apply to all contractual partners processing and generating content on the joinus4health.eu website and platform on behalf of the UMG.

The Data Controller ("Controller") is the University Medicine Greifswald (UMG).
The Data Processor ("Processor") are project partners bound to the UMG by Data Processing Agreements (DPA).

## Requirements
As the Processors have some privileges accessing the WordPress-System, some requirements are needed here.

### General
The Processor assures to use secure systems only to access the Joinus4health-Systems.
This includes a current operation system with installed security updates and no access for non-processors to this system.

### Sensitive Data
The Processor assures to do everything in its power to prevent sensitive data to leak to externals.
Furthermore, no sensitive data is stored on third-party-devices or in-cloud-services by externals.

"Sensitive Data" explicitly includes all personal data of the subjects (e.g. ip-addresses, e-mail-addresses, names), administration credentials (like user/passwords, keys) and internal information about the technical systems used.

"Externals" are all companies and service providers that are not Processor nor sub-Processor in this project.

As Editor you should never have access to sensitive data.
I for some reason you see sensitive data from the users of the website/platform, please contact the UMG-IT immediately! → `ship_admin+ju4h@uni-greifswald.de`

### Transferring Sensitive Data
Sensitive data is only transferred encrypted.
If using third-party transferring services, the data must be end-to-end encrypted with a state of the art, strong encryption method.
The credentials must be transferred over an independent channel.

As an Editor you should never have to transfer sensitive data.

### Process of editing and creating content
To generate a good user experience, we want to create consistent content using the same styles and wordings.

For technical questions on how to use the system, please contact our main developers of the system, Science4People.

### Passwords
The password must meet the following criteria:
- at least 10 characters long
- use random characters or at least four random words to create a good password with high entropy
    - examples
        - `mhh4lwhwiqg` (my husband has four legs, when he walks in quadruped gait)
        - `does Muhammad Entry executive` (words taken from [random wikipedia-page](https://en.wikipedia.org/wiki/Special:Random))
    - [understand, how entropy works](https://xkcd.com/936/)
- no repetitive content as `abcabcabc`
- don't use a password or parts of it from any other account you have
- don't write your password on a piece of paper lying around in the open
- [you may want to use a password manager to store your passwords!](https://en.wikipedia.org/wiki/KeePassXC)

## Checks
The UMG must check randomly, whether the rules are respected.