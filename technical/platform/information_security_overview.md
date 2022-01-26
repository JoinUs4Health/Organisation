# Information Security Overview

<!-- TOC START min:2 max:5 link:true asterisk:false update:true -->
- [Project Overview](#project-overview)
    - [Coordinator UMG](#coordinator-umg)
    - [Short Project Description](#short-project-description)
    - [Technical Infrastructure Overview](#technical-infrastructure-overview)
        - [Partner science4people](#partner-science4people)
        - [Provider netcup - Platform](#provider-netcup---platform)
        - [Provider ??? - Conference-System](#provider----conference-system)
    - [Software](#software)
        - [WordPress - Base Platform](#wordpress---base-platform)
- [Data processed in the Components of the JoinUs4Healt-Platform](#data-processed-in-the-components-of-the-joinus4healt-platform)
    - [The Users Profile](#the-users-profile)
- [User Authentication](#user-authentication)
<!-- TOC END -->

## Project Overview
### Coordinator UMG

### Short Project Description

### Technical Infrastructure Overview
![](uml/platform_overview_structure.svg)

#### Partner science4people
Our project-partner (TODO adresse) science4people is responsible for the technical administration of the sub-systems such as WordPress, LDAP, the Questionnaire-System.
Science4people signed an appropriate data processing agreement/Auftragsverarbeitungsvertrag (DPA/AVV) with the UMG and we provide further guidelines and restrictions regarding security. Please see the document `requirements_administration.pdf` for more information.

#### Provider netcup - Platform
https://netcup.de (TODO adresse) provides the main server environment as "Managed Private Server" running:
- the main WordPress-Instance with the platform
- the LDAP-Server *TODO; Status: planning; to be implemented*
- the Questionnaire-System *TODO; Status: planning; to be implemented*

Also the WordPress-Website https://joinus4health.eu runs on a netcup server. Please see the data processing agreement/Auftragsverarbeitungsvertrag (DPA/AVV) with netcup for details about the contract and netcups TOMs.

#### Provider ??? - Conference-System
 *TODO; Status: planning; to be implemented*

### Software
#### WordPress - Base Platform


## Data processed in the Components of the JoinUs4Healt-Platform

### The Users Profile
The minimum personal data for new users needed to create an account is an e-mail-address.
However, the user is requested to give some more information according to the following table.
Also other fields then the e-mail-address can contain personal data.

| Information                                                        | Required    | publicly visible |
| ------------------------------------------------------------------ | ----------- | ---------------- |
| user name (real or fictional)                                      | required    | yes              | 
| password                                                           | required    | no               |
| consent with terms of conditions and data privacy agreement        | required    | no               |
| e-mail-address                                                     | required    | no               |
| preferred language (DE, EN, PL, NL)                                | required    | optional         |
| additional languages                                               | recommended | optional         |
| country of residence                                               | required    | yes              |
| post code of residence                                             | recommended | no               |
| year of birth (other users only see age group)                     | recommended | optional         |
| gender (male, female, gender-neutral)                              | recommended | optional         |
| which RRI group(s)                                                 | recommended | optional         |
| whether the user is a participant in one of the cohorts            | recommended | optional         |
| whether the scientist / staff member works at a cohort institution | recommended | optional         |
| experience                                                         | optional    | optional         |
| specific interests                                                 | optional    | optional         |
| how they became aware of the platform                              | optional    | no               |
| upload of photograph or dummy                                      | optional    | optional         |

## User Authentication
The authentication of the user is done by WordPress (the base of the platform) internally. Other systems as the Conference-Platform and the Questionnaire-System are connected via our own LDAP-Server.



