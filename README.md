# Cloudit
[![CI](https://github.com/rooted-io/cloudit/actions/workflows/ci.yaml/badge.svg)](https://github.com/rooted-io/cloudit/actions/workflows/ci.yaml)  [![Release](https://github.com/rooted-io/cloudit/actions/workflows/release.yaml/badge.svg)](https://github.com/rooted-io/cloudit/actions/workflows/release.yaml)  [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)



Automatic Cloud Posture Audit Tool ☁️ 🔬  

<img width="733" height="533" alt="image" src="https://github.com/user-attachments/assets/623afee1-827e-44cd-a6d3-6a8ce6aaa9b4" />

## Abstract


`Cloudit` is a script for automatic, multicloud and  multi-tenant *CSPM* (Cloud Security Posture Management).  
The idea is to wrap some usefull open source cloud posture audit tools like [prowler](https://github.com/prowler-cloud/prowler)  behind an higher level abstraction in order to execute the tools in parallel on multiple customer's public cloud accounts.  

> [!WARNING]  
> This tools makes API calls to cloud provider endpoints and services: these calls may be billed by the provider.  

As of right now this only work with `aws`, `azure` and `gcp` and uses json files to store customer credentials (inside the `credentials` folder).  
The *aws* credentials file is called `aws-credentials.json` and it is structured like this:  

```json
{
    "customers": [
        {
            "customer_name": "foo",
            "REGIONS": ["region-1", "region-2"],
            "SERVICES": ["aws_service_1", "aws_service_2"],
            "AWS_ACCESS_KEY_ID": "foo-access-key-here",
            "AWS_SECRET_ACCESS_KEY": "foo-secret-access-key-here",
        },
        {
            "customer_name": "godfrey",
            "REGIONS": ["region-1", "region-2", "region-3"],
            "SERVICES": ["aws_service_1", "aws_service_2", "aws_service_3"],
            "AWS_ACCESS_KEY_ID": "godfrey-access-key-here",
            "AWS_SECRET_ACCESS_KEY":"godfrey-secret-access-key-here"
        }

    ]
}
```   

The *azure* credentials file is called `azure-credentials.json` and it is structured like this:  

```json
{
    "customers": [
        {
            "customer_name": "foo",
            "SERVICES": ["defender", "iam"],
            "AZURE_CLIENT_ID": "foo-client-id-here",
            "AZURE_CLIENT_SECRET": "foo-client-secret-here",
            "AZURE_TENANT_ID": "foo-tenant-id-here",
            "AZURE_SUBSCRIPTION_ID":
            ["foo-subscription-id-1-here"]
        },
        {
            "customer_name": "godfrey",
            "SERVICES": ["defender", "iam"],
            "AZURE_CLIENT_ID": "godfrey-client-id-here",
            "AZURE_CLIENT_SECRET": "godfrey-client-secret-here",
            "AZURE_TENANT_ID": "godfrey-tenant-id-here",
            "AZURE_SUBSCRIPTION_ID":
            ["godfrey-subscription-id-1-here", "godfrey-subscription-id-2-here"]
        }

    ]
}
```   


The *gcp* credentials file is called `gcp-credentials.json` and its structured like this:  

```json
{
    "customers": [
        {
            "customer_name": "customer-name-here",
            "SERVICES": ["iam", "dns"],
            "GOOGLE_APPLICATION_CREDENTIALS": "path-to-gcp-sa-json-file-here (eg. credentials/gcp/customer1-gcp-sa.json)"
        },
        {
            "customer_name": "customer-name-here",
            "SERVICES": ["iam", "dns"],
            "GOOGLE_APPLICATION_CREDENTIALS": "path-to-gcp-sa-json-file-here (eg. credentials/gcp/customer2-gcp-sa.json)"
        }

    ]
}
```   
