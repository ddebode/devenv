# STRIDE analysis Template

## Operation: <operation-name>

| Vul | Threat description | Requirement |
|-----|--------------------|-------------|
| S1  |                    |             |
| T1  |                    |             |
| R1  |                    |             |
| I1  |                    |             |
| D1  |                    |             |
| E1  |                    |             |


| Name            | Description | Checked |
|-----------------|-------------|---------|
| S1 Threat Desc  |             |         |
| S1 Security Req |             |         |
| S1 Mitigation   |             |         |
|-----------------|-------------|---------|
| T1 Threat Desc  |             |         |
| T1 Security Req |             |         |
| T1 Mitigation   |             |         |
|-----------------|-------------|---------|
| R1 Threat Desc  |             |         |
| R1 Security Req |             |         |
| R1 Mitigation   |             |         |
|-----------------|-------------|---------|
| I1 Threat Desc  |             |         |
| I1 Security Req |             |         |
| I1 Mitigation   |             |         |
|-----------------|-------------|---------|
| D1 Threat Desc  |             |         |
| D1 Security Req |             |         |
| D1 Mitigation   |             |         |
|-----------------|-------------|---------|
| E1 Threat Desc  |             |         |
| E1 Security Req |             |         |
| E1 Mitigation   |             |         |
|-----------------|-------------|---------|

S1-Desc:  
S1-Req:  
S1-Mit:


Example:

| Vul | Threat description                               | Requirement                                |
|-----|--------------------------------------------------|--------------------------------------------|
| S1  | An users which is not logged in can supply totp. | Only loggedin users can see the totp page. |
| T1  | User gives an invalid totp.                      | Server must check that totp is valid.      |
| T2  | Users gives expired totp.                        | Server must not except expired topts.      |
| R1  |                                                  |                                            |
| I1  |                                                  |                                            |
| D1  |                                                  |                                            |
| E1  |                                                  |                                            |

To help with the stride analysis. Which questions should I ask?

Spoofing:  

* Is authentication required for OPERATION?
* How strong an authentication is required?
* Who should be able to perform OPERATION?

Tampering:

* Are there certain conditions that need to be satisfied before, during or after OPERATION?
* Must tampering with operation be prevented or detected?

Repudiation:

* Should OPERATION be traceable?
* If so, to what aspects of it should be traceable (person, time, place, ...)?

Information Disclosure:

* Is the content of OPERATION (i.e. data on which it operates) confidential? If so, who is allowed to see it?
* Is the meta-data of OPERATION's content (e.g. name or identifier) confidential? If so, who is allowed to see it?
* Is the fact that OPERATION is performed confidential? If so, who is allowed to know it?
* How long must the information remain confidential?

Denial of Service?

* Is it important that operation can be performed at any time?
* What is the accepted down-time for OPERATION?

Escalation of priveleges:

* On what data is a user allowed to perform OPERATION?
* What privileges are required to perform OPERATION?
* Under what conditions is user allowed to perform OPERATION? For example, this OPERATION is only allowed during office hours.
