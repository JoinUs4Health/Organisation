# Technical Decisions regarding the JoinUs4Health-Platform

## Login
- Decision: the registration and login is done locally on our server only
- Alternatives
    - Login via Google, Facebook or any other third party company is not possible for privacy reasons. The personal data of our users must remain their personal data and must not be exchanged in any way with a third party, we have no data protection agreement with.

## Abuse report
- Decision
    - After a discussion on 14/3 with RK and MP, we suggest the following alternative:
    - it is important to allow report abuse as we cannot guarantee that the review process is 100% effective
    - but it appears an overkill, especially since all items undergo a prior review before being posted
    - instead, we suggest to 
        - set up a separate email address to ensure all abuse reports go to a specific (group of) individual(s) such as abuse@joinus4health.eu
        - document a short set of guidelines what to include when reporting abuse, e.g.
        - copy url of the item, which includes a unique identifier
        - specify the reason for reporting abuse if it is not obvious from the post itself
- Alternatives
    - add a report-abuse-button to every element