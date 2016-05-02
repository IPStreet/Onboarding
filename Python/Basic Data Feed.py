import requests
import json


def search_by_owner(input):
    """ Hello World! example Concept Search API call
    Prints a standard response json object when called """

    endpoint = 'https://api.ipstreet.com/v1.1/data/patent'
    headers = {'x-api-key': "5AsaMTe6HUypUlAqv3Rw3E6Pvjo4dYL64Rr2z2va"}
    payload = json.dumps({'q': {'owner':input}})
    r = requests.post(endpoint, headers=headers, data=payload)

    print(r.text)

def search_by_patent_number(input):


    endpoint = 'https://api.ipstreet.com/v1.1/data/patent'
    headers = {'x-api-key': "5AsaMTe6HUypUlAqv3Rw3E6Pvjo4dYL64Rr2z2va"}
    payload = json.dumps({'q': {'patent_number': input}})
    r = requests.post(endpoint, headers=headers, data=payload)

    print(r.text)

def search_by_granted_Owner(input):

    endpoint = 'https://api.ipstreet.com/v1.1/data/patent'
    headers = {'x-api-key': "5AsaMTe6HUypUlAqv3Rw3E6Pvjo4dYL64Rr2z2va"}
    payload = json.dumps({'q': {'owner': input, 'applied':False}})
    r = requests.post(endpoint, headers=headers, data=payload)

    print(r.text)

if __name__ == '__main__':
    # search_by_owner('microsoft')
    # search_by_patent_number('8618773')
    search_by_granted_Owner('microsoft')