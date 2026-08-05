# GCP Infrastructure Take-Home: Track A

## How to run it

Assume you are starting from an empty project and a clean terminal environment. You will need `gcloud`, `terraform`, `terragrunt`, and `helm` installed.

### 1. Authenticate to Google Cloud

```bash
gcloud auth login
gcloud auth application-default login
gcloud config set project cand-a3-202608
gcloud auth application-default set-quota-project cand-a3-202608
```

### 2. Which track I chose and why

I chose Track A because I wanted to get acquainted with Terraform, Terragrunt, and Helm. I know these are the industry-standard tools right now, and I wanted to use this assignment to challenge myself and learn how they work together.

### 3. Changes I would make before production

* I would avoid having a hard-coded Project ID in the files so the code could be easily reused across different environments.
* I would use stable, pinned versions of Nginx and other programs in my Helm charts instead of using the `latest` tag so deployments don't break unexpectedly.
* I would ensure the production GKE nodes are completely private for security purposes.

### 4. Challenges & Incomplete Items

Since I was learning Terragrunt on the fly, it took me a while to understand its caching system. It isolates code in temporary folders, so getting my dev environment to see my VPC and GKE modules took some trial and error. Additionally, when I generated the `prod` plan, the binary file got buried deep inside that hidden cache folder, and I had to search for it to pull it out and push it to GitHub.

### 5. Assumptions & Design Decisions

* Used the provided `cand-a3-202608-tfstate` GCS bucket to store the Terraform state remotely.
* Provisioned a small `e2-medium` machine with 1 node for the dev environment to ensure I stayed well under the 12 vCPU limit in `europe-west1`.
