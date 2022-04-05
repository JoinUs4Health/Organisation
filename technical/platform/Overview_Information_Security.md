# Information Security Overview

<!-- TOC START min:2 max:5 link:true asterisk:false update:true -->
- [Project Overview](#project-overview)
    - [Coordinator UMG](#coordinator-umg)
    - [Project Description](#project-description)
    - [Technical Infrastructure Overview](#technical-infrastructure-overview)
        - [Partner science4people](#partner-science4people)
        - [Provider netcup - Platform](#provider-netcup---platform)
        - [Provider ??? - Conference-System](#provider----conference-system)
    - [Software](#software)
        - [WordPress - Base Platform](#wordpress---base-platform)
        - [LimeSurvey - Questionnaire-System](#limesurvey---questionnaire-system)
        - [BigBlueButton - Conference-System](#bigbluebutton---conference-system)
- [Data processed in the Components of the JoinUs4Healt-Platform](#data-processed-in-the-components-of-the-joinus4healt-platform)
    - [The Users Profile](#the-users-profile)
- [User Authentication](#user-authentication)
- [Security](#security)
<!-- TOC END -->

## Project Overview
### Coordinator UMG
- Project Coordinator: Dr. Birgit Schauer
- Project Management: Dr. Sabine Schipf, Antje Witt
- IT-Coordination: Benjamin Winter, Dr. Stephan Struckmann

### Project Description
Prospective cohort studies allow tackling major research questions regarding health and well-being of individuals and communities.
JoinUs4Health aims to combine Responsible Research and Innovation (RRI) and crowdsourcing as converging approaches to promote inclusive innovation and citizens engagement in cohort research.
Objectives are: 

1. ESTABLISH and REVIEW a conceptual framework; 
2. DEVELOP, TEST and APPLY technology to engage various societal actors; 
3. EXPLORE, IMPLEMENT and MONITOR institutional changes and incorporate RRI into the governance framework of three cohort institutions; 
4. ADVANCE RRI and citizen science into the mainstream of public engagement, science communication and education; and 
5. PROMOTE engagement and COMMUNICATE and DISSEMINATE outputs via traditional and innovative means. 

The concept is based on crowdsourcing, where cohort participants, the general public and other societal actors can propose research questions or contribute to addressing such questions via working groups.
Researchers are encouraged to actively engage citizens and other societal actors in dialogues during the design of their analyses and interpretation of results.
Specialists will enhance this synergy by online and offline activities based on the communication strategy to boost engagement and ensure sustainability.
An interactive, web-based platform facilitates and social media promotes engagement, communication and dissemination.
Targeted education activities are designed and implemented at the school, university and citizen level.
Six institutional changes provide the required conditions targeting the areas engagement, open access, communication and dissemination, management, implementation of RRI at cohort institutions, and education.
Their implementation will be mentored by an RRI experienced partner and an international RRI advisory panel.
It is hypothesized that this approach also counteracts the trend of decreasing participation in cohort studies.

### Technical Infrastructure Overview
The following UML-Diagram shows the overall technical infrastructure as well as the user view, the administrators and the data processing agreements.  
The main system ist based on WordPress.
It provides the platform with all content and functions.
The central user authentication is done with the WordPress-internal user-management.
The data for the WordPress system is separated in two databases, one for personal data and user accounts, the second one for the content.

![](uml/platform_overview_structure.svg)

#### Partner science4people
Our project-partner Science4People (Warszawska Nr 6 Lok 23; Bialystock 15 063, Poland) is responsible for the technical administration of the sub-systems such as WordPress and the Questionnaire-System.
Science4people signed an appropriate data processing agreement/Auftragsverarbeitungsvertrag (DPA/AVV) with the UMG and we provide further guidelines and restrictions regarding security.
Please see the document `requirements_administration` for more information.

#### Provider netcup - Platform
The provider https://netcup.de (netcup GmbH; Daimlerstraße 25; D-76185 Karlsruhe) provides the main server environment as "Managed Private Server" running:

- the main WordPress-Instance with the platform
- one server dedicated for the database with the personal data of all users
- the Questionnaire-System *TODO; Status: planning; to be implemented; details following*

Also the WordPress-Website https://joinus4health.eu runs on a netcup server but is strictly separated from the platform.
Please see the data processing agreement/Auftragsverarbeitungsvertrag (DPA/AVV) with netcup for details about the contract and netcups TOMs.

#### Provider ??? - Conference-System
*TODO; Status: planning; to be implemented; details following*

### Software
#### WordPress - Base Platform
- hosted at netcup on a dedicated server
- purpose: provide the base platform with content, user authentication and team structures

Netcup provides a special WordPress-environment with configuration options on certain security aspects and automatic updates of the base software, plugins and themes.  
For details on the WordPress-configuration and all Plugins used, please see the documentation `Server_WordPress_documentation`.

#### LimeSurvey - Questionnaire-System
- hosted at netcup on a dedicated server
- purpose: Users of the platform are allowed to create small anonymous surveys within their topics
- *TODO; Status: planning; to be implemented; details following*

#### BigBlueButton - Conference-System
- hosted at ???
- purpose: to enhance team communication, we provide a conference system for virtual meetings
- *TODO; Status: planning; to be implemented; details following*

## Data processed in the Components of the JoinUs4Healt-Platform

### The Users Profile
The minimum personal data for new users needed to create an account is an e-mail-address.
However, the user is requested to give some more information according to the following table.
Also other fields then the e-mail-address can contain personal data.

| Information                                                        | Required | publicly visible                 |
| ------------------------------------------------------------------ | -------- | -------------------------------- |
| user name (real or fictional)                                      | yes      | yes                              |
| password                                                           | yes      | no (not possible, hashed&salted) |
| consent with terms of conditions and data privacy agreement        | yes      | no                               |
| e-mail address                                                     | yes      | no                               |
| main language (DE, EN, PL, NL)                                     | no       | optional                         |
| additional languages                                               | optional | optional                         |
| country                                                            | no       | yes                              |
| post code of residence                                             | optional | no                               |
| year of birth (other users only see age group)                     | optional | optional (shows age group)       |
| gender (male, female, gender-neutral)                              | optional | optional                         |
| which RRI group(s)                                                 | optional | optional                         |
| whether the user is a participant in one of the cohorts            | optional | optional                         |
| whether the scientist / staff member works at a cohort institution | optional | optional                         |
| experience                                                         | optional | optional                         |
| specific interests                                                 | optional | optional                         |
| how they became aware of the platform                              | optional | no                               |

## User Authentication
The authentication of the user is done by WordPress (the base of the platform) internally.
Other systems as the Conference-Platform and the Questionnaire-System are connected via their APIs with WordPress as the primary system.

## Security
- all connections are TLS encrypted (at least v1.3, only high ciphers)
- database separation for personal data (user profiles) and platform data (other content)
- automatic updates for all used systems
- operational requirements for all administrators, please see `requirements_administration`

