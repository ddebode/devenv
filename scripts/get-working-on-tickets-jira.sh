#!/usr/bin/python
# Get all jira tickets assigned to current user which are in In Development and Review
# TODO implement authentication

import requests
import json 

url = 'https://connectis.atlassian.net/rest/api/2/search?jql=assignee=currentuser()%20AND%20(status=%22In%20Development%22%20OR%20status=%22Review%22)&fields=key,summary'

cookies = {'cloud.session.token': '<get session cookie from browser>'}

resp = requests.get(url=url, cookies=cookies)
data = resp.json()
print('Working on: ')
listOfIssues = data['issues']
for issue in listOfIssues:
    print(issue['key'] + ": " + issue['fields']['summary'])
