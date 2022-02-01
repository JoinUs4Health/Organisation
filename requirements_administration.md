**Changelog**

| date       | editor  | changes                                               |
| ---------- | ------- | ----------------------------------------------------- |
| 12.05.2021 | winterb | added `General`, `Sensitive Data`; changes in wording |
| 26.04.2021 | winterb | added basic requirements                              |

# Requirements for administrators of the JoinUs4Health project
These requirements apply to all contractual partners administrating the joinus4health.eu website and -platform on behalf of the UMG.

- Data Controller ("Controller"): University Medicine Greifswald
- Data Processor ("Processor"): Science4People

## Requirements
### General
The Processor assures to use secure systems only to access the Joinus4health-Systems.
This includes a current operation system with installed security updates and no access for non-processors to this system.

### Sensitive Data
The Processor assures to do everything in its power to prevent sensitive data to leak to externals.
Furthermore, no sensitive data is stored on third-party-devices or in-cloud-services by externals.

"Sensitive Data" explicitly includes all personal data of the subjects (e.g. ip-addresses, e-mail-addresses, names), administration credentials (like user/passwords, keys) and internal information about the technical systems used.

"Externals" are all companies and service providers that are not Processor nor sub-Processor in this project.

### Transferring Sensitive Data
Sensitive data is only transferred encrypted. If using third-party transferring services, the data must be end-to-end encrypted with a state of the art, strong encryption method. The credentials must be transferred over an independent channel.

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

### Changes on the System
All major changes on the system, especially changes with influence on safety or security of the system or regarding personal data of the users must be approved by the UMG beforehand.

### Installing Plugins
Do not install any plugins before the approval of the UMG.
The Plugins' terms and privacy have to be checked, before they are installed on the productive system.

### Updates
Security updates must be applied immediately, there is no valid reason to delay this.
The system should install these updates automatically.

## Checks
The UMG has to check randomly, whether the rules are respected.