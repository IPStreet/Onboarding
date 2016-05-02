import requests
import json



def search_full_text(input):

    endpoint = 'https://api.ipstreet.com/v1/full_text'
    headers = {'x-api-key': "5AsaMTe6HUypUlAqv3Rw3E6Pvjo4dYL64Rr2z2va"}
    payload = json.dumps({'raw_text': str(input)})
    r = requests.post(endpoint, headers=headers, data=payload)

    print(json.dumps(r.json(), sort_keys=True, indent=4, separators=(',', ': ')))

def search_full_text_grant_only(input):

    endpoint = 'https://api.ipstreet.com/v1/full_text'
    headers = {'x-api-key': "5AsaMTe6HUypUlAqv3Rw3E6Pvjo4dYL64Rr2z2va"}
    payload = json.dumps({'raw_text': str(input), 'q':{'applied':False}})
    r = requests.post(endpoint, headers=headers, data=payload)

    print(json.dumps(r.json(), sort_keys=True, indent=4, separators=(',', ': ')))


if __name__ == '__main__':
    claim = "a configurable battery pack charging system coupled to said charging system controller, said battery pack and a power source, wherein said configurable battery pack charging system charges said battery pack in accordance with said battery pack charging conditions set by said charging system controller."

    # search_full_text(claim)
    search_full_text_grant_only(claim)